#!/bin/bash

FILE="address_book.txt"

function add_contact {
    echo "Enter name:"
    read name
    echo "Enter phone number:"
    read phone
    echo "Enter email:"
    read email

    echo "$name,$phone,$email" >> "$FILE"
    echo "Data saved."
}

function search_contact {
    echo "Enter text to search:"
    read text_to_search
    echo "Search results:"

    grep -i "$text_to_search" "$FILE" || echo "Contact not found."
}

function remove_contact() {
    echo "Enter data of contact to remove: " 
    read data_to_remove
    
    if grep -i "$data_to_remove" "$FILE"; then
        sed -i '' "/$data_to_remove/d" "$FILE"
        echo "Data of contact removed."
    else
        echo "No contact found."
    fi
}


case "$1" in
    add)
        add_contact
        ;;
    search)
        search_contact
        ;;
    remove)
        remove_contact
        ;;
    *)
        echo "Usage: $0 {add|search|remove}"
        ;;
esac
