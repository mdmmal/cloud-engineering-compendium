# Day 05 — Python Notes
Date: 3/26/26
Lab: LabEx Python — Data Collections: Lists, Dictionaries, and Sets

## Concept Covered
Choosing the right data structure for the right job — lists, dictionaries,
and sets — and combining all three into a functional menu-driven system.

## What It Means in Plain English
A list is an ordered sequence. Use it when you just need to store things
in order and loop through them. In this lab: mission names in order.

A dictionary is a lookup table with named keys. Use it when each item has
multiple pieces of information attached to it. In this lab: each mission
had a destination, date, and crew — all stored under the mission name as
the key. You get to any piece of info instantly without looping.

A set is a collection that refuses duplicates automatically. Use it when
you need unique items only. In this lab: astronauts who worked multiple
missions still only appeared once in the set.

The real skill is knowing which one to reach for. Ordered sequence = list.
Named lookup = dictionary. Unique items = set.

## Code I Wrote
```python
missions = ["Apollo 11", "Artemis I", "Mars Survey"]

mission_details = {
    "Apollo 11": {
        "destination": "Moon",
        "date": "1969-07-16",
        "crew": ["Armstrong", "Aldrin", "Collins"]
    }
}

all_astronauts = set()
for mission in mission_details:
    for astronaut in mission_details[mission]["crew"]:
        all_astronauts.add(astronaut)
```

## Why This Matters for Cloud/SRE Work
Every AWS API response is a dictionary — JSON is just dictionaries and
lists nested together. When boto3 returns a list of EC2 instances, each
instance is a dictionary with keys like InstanceId, State, PublicIpAddress.
You will loop through the list and pull values from the dictionary on every
automation script you write. Sets come up when you need to deduplicate
things like security group IDs or instance tags. This lab is the exact
data manipulation pattern behind real cloud automation.

## What Confused Me
The nested dictionary structure — a dictionary where the value is itself
another dictionary. Had to slow down to trace which key belonged to which
level. This will come up constantly in JSON API responses so needs more reps.