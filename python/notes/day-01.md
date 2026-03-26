# Day 01 — Python Notes
Date: 3/25/26
Lab: LabEx Python — Lists, Dictionaries, Sets, and Control Flow

## Concept Covered
Five concepts in one lab: lists, dictionaries, sets, control flow (if/elif/else),
and functions. Tied together by building a contact manager app from scratch.

## What It Means in Plain English
A list is an ordered collection — like a numbered shelf. You access items
by position: servers[0] gets the first one.

A dictionary is a lookup table — like a contact card. Instead of a position,
you use a name: contact["phone"] gets the phone number directly.

A set is like a list but it refuses duplicates automatically. Good for
favorites, tags, or anything where each item should only appear once.

Control flow (if/elif/else) is just decision making — if this is true,
do that. Otherwise do this other thing.

Functions are reusable blocks of code with a name. Instead of writing
the same 5 lines in 3 places, you write them once as add_contact()
and just call it whenever you need it.

The contact manager combined all five: a dictionary stored each contact,
a set tracked favorites, and functions handled each menu action.

## Code I Wrote

Representative examples of what was covered:

contacts = {}
favorites = set()

def add_contact(name, phone, email):
    contacts[name] = {"phone": phone, "email": email}

def add_to_favorites(name):
    favorites.add(name)

def display_contacts():
    for name, info in contacts.items():
        print(name, info)

## Why This Matters for Cloud/SRE Work
Dictionaries are how every AWS API response comes back — JSON is just
a dictionary. Lists are how you store groups of servers, S3 buckets,
or EC2 instance IDs. Functions keep automation scripts clean so you
can call check_server() 100 times without rewriting the logic each time.

## What Confused Me
Confused matrices and tables with lists and dictionaries. They are not
the same thing. A matrix is a list of lists (a grid of rows and columns)
and is mostly used in data science, not SRE/DevOps work. For this
career path, dictionaries and lists are what matter. Matrices are not
something to focus on right now.