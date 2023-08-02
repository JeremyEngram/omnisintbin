#!/bin/bash

# Define the list of options for the menu
options=("See running processes" 
         "Check the status of a service" 
         "Start a service" 
         "Restart a service" 
         "Stop a service" 
         "Reload a service's configuration" 
         "Edit a service's configuration" 
         "Reload systemd manager configuration" 
         "Enable a service to startup on boot" 
         "Disable a service to startup on boot" 
         "Start per-user service" 
         "Restart per-user service" 
         "Stop per-user service" 
         "See all active units" 
         "See all service units" 
         "See filtered units (all running service)" 
         "See all service files, see which are enabled or disabled" 
         "List all units with specific status" 
         "List all unit files" 
         "See log items from the most recent boot" 
         "See only kernel messages" 
         "Get the log entries for a service since boot" 
         "List the dependencies of a service" 
         "See low level details of a service settings on the system" 
         "List currently loaded targets" 
         "Change current target" 
         "Change default target" 
         "Quit")

# Define the function for each option
function see_running_processes {
  systemctl
}

function check_status_of_service {
  echo "Enter the name of the service:"
  read service_name
  systemctl status $service_name.service
}

function start_service {
  echo "Enter the name of the service:"
  read service_name
  systemctl start $service_name.service
}

function restart_service {
  echo "Enter the name of the service:"
  read service_name
  systemctl restart $service_name.service
}

function stop_service {
  echo "Enter the name of the service:"
  read service_name
  systemctl stop $service_name.service
}

function reload_service_config {
  echo "Enter the name of the service:"
  read service_name
  systemctl reload $service_name.service
}

function edit_service_config {
  echo "Enter the name of the service:"
  read service_name
  systemctl edit $service_name.service
}

function reload_systemd_manager_config {
  systemctl daemon-reload
}

function enable_service_on_boot {
  echo "Enter the name of the service:"
  read service_name
  systemctl enable $service_name.service
}

function disable_service_on_boot {
  echo "Enter the name of the service:"
  read service_name
  systemctl disable $service_name.service
}

function start_per_user_service {
  echo "Enter the name of the service:"
  read service_name
  systemctl --user start $service_name.service
}

function restart_per_user_service {
  echo "Enter the name of the service:"
  read service_name
  systemctl --user restart $service_name.service
}

function stop_per_user_service {
  echo "Enter the name of the service:"
  read service_name
  systemctl --user stop $service_name.service
}

function see_all_active_units {
  systemctl list-units
}

function see_all_service_units {
  systemctl list-units -at service
}

function see_filtered_units {
  systemctl list-units -t service --state running
}

function see_service_files {
  systemctl list-unit-files -at service
}

function list_units_with_specific_status {
  echo "Enter the status of the units (inactive/active/enabled/running/exited):"
  read status
  systemctl list-units --all --state=$status
}

function list_all_unit_files
