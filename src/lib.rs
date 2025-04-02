use ic_cdk_macros::{init, query, update};
use std::cell::RefCell;

thread_local! {
    static COUNTER: RefCell<u64> = RefCell::new(0);
}

#[init]
fn init() {
    COUNTER.with(|c| *c.borrow_mut() = 0);
}

#[update]
fn increment() -> u64 {
    COUNTER.with(|c| {
        *c.borrow_mut() += 1;
        *c.borrow()
    })
}

#[query]
fn get_count() -> u64 {
    COUNTER.with(|c| *c.borrow())
}

#[query]
fn hello(name: String) -> String {
    format!("hello {}", name)
}

// Export candid service using updated syntax
ic_cdk::export_candid!();
