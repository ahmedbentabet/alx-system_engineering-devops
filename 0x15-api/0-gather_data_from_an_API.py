#!/usr/bin/python3
"""
This module retrieves and displays an employee's TODO list progress
from a REST API based on their employee ID.
"""
import requests
import sys


def get_employee_todo_progress(employee_id):
    # Base URL for the API
    base_url = "https://jsonplaceholder.typicode.com/"

    # Get employee information
    employee_response = requests.get(f"{base_url}users/{employee_id}")
    employee_data = employee_response.json()
    employee_name = employee_data.get('name')

    # Get TODO list for the employee
    todos_response = requests.get(f"{base_url}users/{employee_id}/todos")
    todos_data = todos_response.json()

    # Calculate progress
    total_tasks_number = len(todos_data)
    completed_tasks = [task for task in todos_data if task.get('completed')]
    completed_tasks_number = len(completed_tasks)

    # Display progress
    print(f"Employee {employee_name} is done with tasks"
          f"({completed_tasks_number}/{total_tasks_number}):")

    # Display completed tasks
    for task in todos_data:
        if task.get('completed'):
            print(f"\t {task.get('title')}")


if __name__ == "__main__":
    employee_id = sys.argv[1]
    get_employee_todo_progress(employee_id)
