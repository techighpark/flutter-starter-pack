

# [MarkDown Guide Links](https://www.markdownguide.org/basic-syntax/#overview "To add a title")

**{{bold}}**  
__{{bold}}__  
*{{italic}}*  
***{{bold&italic}}***    
___{{bold&italic}}___  
__*{{bold&italic}}*__  
**_{{bold&italic}}_**  
_**{{bold&italic}}**_

## Blockquotes

> Dorothy followed her through many of the beautiful rooms in her castle.
>
> The Witch bade her clean the pots and kettles and sweep the floor and keep the fire fed with wood.


> Dorothy followed her through many of the beautiful rooms in her castle.
>
>> The Witch bade her clean the pots and kettles and sweep the floor and keep the fire fed with wood.


> > #### The quarterly results look great!
>
> - Revenue was off the chart.
> - Profits were higher than ever.
    >
    >  *Everything* is going according to **plan**.


## List


#### Ordered Lists
1. First item
2. Second item
3. Third item
4. Fourth item


1. First item
1. Second item
1. Third item
1. Fourth item


1. First item
8. Second item
3. Third item
5. Fourth item


1. First item
2. Second item
3. Third item
    1. Indented item
    2. Indented item
4. Fourth item



#### Unordered Lists

- First item
- Second item
- Third item
- Fourth item


* First item
* Second item
* Third item
* Fourth item


+ First item
+ Second item
+ Third item
+ Fourth item


- First item
- Second item
- Third item
    - Indented item
    - Indented item
- Fourth item


#### Starting Unordered List Items With Numbers
- 1968\. A great year!
- I think 1969 was second best.


#### Code Blocks

1. Open the file.
2. Find the following code block on line 21:

        <html>
          <head>
            <title>Test</title>
          </head>

3. Update the title to match the name of your website.


1. Open the file containing the Linux mascot.
2. Marvel at its beauty.

   ![Images](./assets/images/image1.jpg)

3. Close the file.


## Code

At the command prompt, type `nano`.
## Escaping Backticks
``Use `code` in your Markdown file.``


## Links
My favorite search engine is [Duck Duck Go](https://duckduckgo.com).  
<https://www.markdownguide.org>  
<fake@example.com>

I love supporting the **[EFF](https://eff.org)**.  
This is the *[Markdown Guide](https://www.markdownguide.org)*.  
See the section on [`code`](#code).


## Escaping Characters
**[Escaping Characters links](https://www.markdownguide.org/basic-syntax/#escaping-characters)**  
To display a literal character that would otherwise be used to format text in a Markdown document, add a backslash (\) in front of the character.  
\* Without the backslash, this would be a bullet in an unordered list.

[1]: https://en.wikipedia.org/wiki/Hobbit#Lifestyle
[1]: https://en.wikipedia.org/wiki/Hobbit#Lifestyle "Hobbit lifestyles"
[1]: https://en.wikipedia.org/wiki/Hobbit#Lifestyle 'Hobbit lifestyles'
[1]: https://en.wikipedia.org/wiki/Hobbit#Lifestyle (Hobbit lifestyles)
[1]: <https://en.wikipedia.org/wiki/Hobbit#Lifestyle> "Hobbit lifestyles"
[1]: <https://en.wikipedia.org/wiki/Hobbit#Lifestyle> 'Hobbit lifestyles'
[1]: <https://en.wikipedia.org/wiki/Hobbit#Lifestyle> (Hobbit lifestyles)
