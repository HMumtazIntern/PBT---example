# Property-Based Testing Example: Ports

This repo demonstrates how Property-Based Testing helps uncover hidden bugs.

### What's being tested?
The function `available_ports/1` should only return ports with `status: :active`, no matter the input.

### The bug:
When `filter: nil`, this version incorrectly returns all ports (even inactive ones).

### How Property-Based Testing helps:
- Random input is generated with varied port statuses and filters (`nil` or otherwise).
- The property enforces this invariant: only `:active` ports should ever be returned.

