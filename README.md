<center><a href="https://otterkring.github.io/MainPage" style="font-size:75%;">return to MainPage</a></center>

# ConvertTo-WesternScript / Replace localized characters
## Convert any localized latin characters (Umlauts, eastern european characters) to basic ASCII

### Why ...

When dealing with computersystems we still have to take care of writing names and descriptions in "native english" characters, because many software products still don't like characters like ä,ö,ü,ß, french, hungarian, slavic, etc. characters.
But maybe you only get localized lists from HR and must import them somehow? This function should help.

### How To

Just take any latin character from file (must be UTF8!) or variable and pipe it to the function or post it directly to the $InputObject parameter:

`'Löffel' | ConvertTo-WesternScript

Result: Loeffel

### Remarks

I just took a list of characters from the ASCII table up to code 640 or so and chose a replacement character that "looked alike". If you are a native to a character and know it should get another supplement, just leave me a note or change the code, but please leave a comment with your github ID in the line you changed.

Happy coding!
Max
