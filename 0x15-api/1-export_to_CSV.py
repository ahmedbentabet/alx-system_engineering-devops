#!/usr/bin/python3
"""
This module exports an employee's TODO list
data to in a CSV file.
"""
import csv
import requests
import sys


def export_employee_todos_to_CSV(employee_id):
    # Base URL for the API
    base_url = "https://jsonplaceholder.typicode.com/"

    # Get employee information
    employee_response = requests.get(f"{base_url}users/{employee_id}")
    employee_data = employee_response.json()
    employee_username = employee_data.get('username')

    # Get TODO list for the employee
    todos_response = requests.get(f"{base_url}users/{employee_id}/todos")
    todos_data = todos_response.json()

    # Open a new CSV file named after the employee ID
    with open(f"{employee_id}.csv", 'w') as new_file:
        # Define the fieldnames for the CSV
        fieldnames = ['USER_ID', 'USERNAME',
                      'TASK_COMPLETED_STATUS', 'TASK_TITLE']
        # Create a DictWriter object, quoting all fields
        csv_writer = csv.DictWriter(
                            new_file,
                            fieldnames=fieldnames,
                            quoting=csv.QUOTE_ALL
                            )

        # Iterate through each task and write it to the CSV
        for task in todos_data:
            csv_writer.writerow({
                'USERNAME': employee_username,
                'USER_ID': employee_id,
                'TASK_COMPLETED_STATUS': task.get('completed'),
                'TASK_TITLE': task.get('title')
            })


if __name__ == "__main__":
    employee_id = sys.argv[1]
    export_employee_todos_to_CSV(employee_id)
