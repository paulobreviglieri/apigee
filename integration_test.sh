#!/bin/bash

# Exit on any error
set -e

# Set environment variables
API_PROXY_URL="https://eval.example.com/lab2a/v1/apigee-demo"

# Send a GET request to the API proxy
#### response=$(curl -s -o /dev/null -w "%{http_code}" -X GET "$API_PROXY_URL" -H "Content-Type: application/json")
response=$(curl -i -k -X GET "https://eval.example.com/lab2a/v1/apigee")

# Check if response code is 200
if [ "$response" -ne 200 ]; then
    echo "Integration Test Failed: Expected HTTP 200 but got $response"
    exit 1
fi

# Check the response body (modify according to your expected output)
expected_output='{"key": "value"}'  # Replace with actual expected output
actual_output=$(curl -s "$API_PROXY_URL")

if [ "$actual_output" != "$expected_output" ]; then
    echo "Integration Test Failed: Expected $expected_output but got $actual_output"
    exit 1
fi

echo "Integration Test Passed!"
