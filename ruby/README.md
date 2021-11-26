# The Gilded Rose still has thorns

## How to use automatically

See video demo here: https://youtu.be/HAewRwiimnY

Or:
- Download code and run bundle install.
- Run rspec to see automated unit tests passing.

## How to use manually

Run irb while working directory is the /lib folder and require gildedrose and items files:
```
$ irb
> require './gilded_rose.rb'
> require './items/backstage_pass_item'
> require './items/cheese_item'
> require './items/conjured_item'
> require './items/legendary_item'
> require './items/regular_item'
```

Enter the following commands:
```
item1 = RegularItem.new('+5 Dexterity Vest', 10, 20)
item2 = CheeseItem.new('Aged Brie', 2, 0)
item3 = RegularItem.new('Elixir of the Mongoose', 5, 7)
item4 = LegendaryItem.new('Sulfuras, Hand of Ragnaros', 0, 80)
item5 = LegendaryItem.new('Sulfuras, Hand of Ragnaros', -1, 80)
item6 = BackstagePassItem.new('Backstage passes to a TAFKAL80ETC concert', 15, 20)
item7 = BackstagePassItem.new('Backstage passes to a TAFKAL80ETC concert', 10, 49)
item8 = BackstagePassItem.new('Backstage passes to a TAFKAL80ETC concert', 5, 49)
item9 = ConjuredItem.new('Conjured Mana Cake', 3, 6)
items = [item1, item2, item3, item4, item5, item6, item7, item8, item9]
inn1 = GildedRose.new(items)
inn1.update
inn1.update
inn1.update
```

## Approach

- I decided to use Ruby, to get more practice with the language
- I decided to use regular rspec tests, as setting up texttest was circuitous
- I wrote my first failing test related to the conjuring item and quickly added this functionality and fixed the test
- I then spent a long time refactoring
- I split GildedRose.update_quality into several different methods with clearer syntax and fewer magic numbers
- Case-when structures aren't working with my syntax so I'm using if-elsif
- Once complete, I added additional tests. These were all green, but were necessary for validating the code and didn't form part of TDD
- Then created one sub-class for each kind of item (regular, conjured, brie, passes, sulfuras)
- Responsibility for changing quality and sell in lies with item classes. GildedRose is now a very small class
- GildedRose class merely sends the messages to the item classes, tested for this
- Put tests for items in the correct places

## Next steps

## Structure of code

The GildedRose class only contains the item list and an update method that sends an update messages to each item. Each item is responsible for updating its sell in and quality, which is more logical than gildedrose doing it.

The task contains a seemingly arbitrary constraint that the Item class not be modified. I achieved this by pushing and duplicating some logic to item sub-classes and making use of the super command in initialise.

There is a contradiction in the task. It says that quality never exceeds 50, but the golden master shows that sulfuras' quality remains at 80 throughout. Both can't be true. This means it has not been possible to convincingly account for edge cases such as regular items being created with a quality greater than 50. Eg, if someone creates a +5 Dexterity Vest with a quality of 80, perhaps quality should regularly degrade from 80, or perhaps its quality should be reset to 50 when it enters gildedrose. Currently, quality will be reset to 50.

