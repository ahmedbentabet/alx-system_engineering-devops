#!/usr/bin/python3
"""
This module exports an employee's TODO list
data to a JSON file.
"""
import json
import requests
import sys


def export_employee_todos_to_JSON(employee_id):
    # Base URL for the API
    base_url = "https://jsonplaceholder.typicode.com/"

    # Get employee information
    employee_response = requests.get(f"{base_url}users/{employee_id}")
    employee_data = employee_response.json()
    employee_username = employee_data.get('username')

    # Get TODO list for the employee
    todos_response = requests.get(f"{base_url}users/{employee_id}/todos")
    todos_data = todos_response.json()

    # Prepare the data in the required format
    json_data = {
        employee_id: [
            {
                'task': task.get('title'),
                'completed': task.get('completed'),
                'username': employee_username
            }
            for task in todos_data
        ]
    }

    # Write the data to a JSON file
    with open(f"{employee_id}.JSON", 'w') as new_file:
        json.dump(json_data, new_file)


if __name__ == "__main__":
    employee_id = sys.argv[1]
    export_employee_todos_to_JSON(employee_id)
