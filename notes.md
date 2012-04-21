## Notes from reading Practical Vim

### Chapter 1 : The Vim Way

* The Dot Formula
* One keystroke to move, one to execute

### Chapter 2 : Normal Mode

* `daw` is more composable than `bdw` and `dbx`
* `<C-a>` and `<C-x>` can be used to do simple arithmetic 
* Operator + Motion = Action : Page 25 for all operators.


### Chapter 3 : Insert Mode

* `C-h`, `C-w` and `C-u` for deleting char, word and line
* `C-o` is Insert Normal mode where u can fire a single command
* `<C-o>zz` allows you to center the line on the screen visually
* We can press `<C-r>0` to paste the text that we just yanked at the current cursor position
* `<C-r>=` allows you to perform simple calculations

### Chapter 4 : Visual Mode

* `V` for linewise visual mode
* `o` for changing the free end of the cursor
* Not directly related, but `gU{motoion}` uppercases the `{motion}` text.
* `Vr{char}` is a good way to select a line and replace all characters with `{char}`
* `I` and `A` are your friends when editing ragged visual blocks

