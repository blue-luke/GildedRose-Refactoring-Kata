# The Gilded Rose still has thorns

## Approach

- I decided to use regular rspec tests, as setting up texttest was circuitous
- I wrote my first failing test related to the conjuring item and quickly added this functionality and fixed the test
- I then spent a long time refactoring
- I split GildedRose into several different methods with clearer syntax and fewer magic numbers
- Case-when structures aren't working with my syntax so I'm using if-elsif
- Once complete, I added additional tests. These were all green, but were necessary for validating the code and didn't form part of TDD

## Next steps

- The GildedRose class is still responsible for too much and is too long
- I want to create item sub-classes that inherit from Item
- One class for each kind of item (regular, conjured, brie, passes, sulfuras)
- Responsibility for changing quality and sell in will lie with item classes
- GildedRose class will merely send the messages to the item classes
