use flutter_rust_bridge::frb;
use windows::Win32::System::Power::{
    self, ES_CONTINUOUS, ES_DISPLAY_REQUIRED, ES_SYSTEM_REQUIRED, EXECUTION_STATE,
};

#[frb(init)]
pub fn init_app() {
    flutter_rust_bridge::setup_default_user_utils();
}

#[frb(sync)]
pub fn start_keep_awake() -> Result<(), String> {
    println!("start keeping awake");
    let flags: EXECUTION_STATE = ES_SYSTEM_REQUIRED | ES_DISPLAY_REQUIRED | ES_CONTINUOUS;
    set_thread_execution_state(flags);
    Ok(())
}

#[frb(sync)]
pub fn stop_keep_awake() -> Result<(), String> {
    println!("stop keeping awake");
    set_thread_execution_state(ES_CONTINUOUS);
    Ok(())
}

fn set_thread_execution_state(flags: EXECUTION_STATE) {
    unsafe {
        Power::SetThreadExecutionState(flags);
    }
}
