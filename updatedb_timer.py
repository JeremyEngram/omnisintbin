import subprocess
import time

def run_updatedb_periodically(interval_minutes):
    """
    Run 'sudo updatedb' command periodically at the specified interval.

    Parameters:
        interval_minutes (int): The interval in minutes between each execution.

    Returns:
        None
    """
    while True:
        try:
            # Run the 'sudo updatedb' command
            subprocess.run(["sudo", "updatedb"], check=True)
            print("updatedb command executed successfully.")

        except subprocess.CalledProcessError as e:
            print(f"Error executing updatedb: {e}")

        # Sleep for the specified interval in minutes
        time.sleep(interval_minutes * 60)

# Set the interval in minutes (30 minutes in this case)
interval_minutes = 30

if __name__ == "__main__":
    run_updatedb_periodically(interval_minutes)
