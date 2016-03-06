## convert minecraft key from Qwerty to Dvorak and back

  * Find `options.txt` file under your minecraft instance folder.

  * From Qwerty to Dvorak:
    ```
    $ mv options.txt qwerty-options.txt
    $ perl convert.pl qwerty2dvorak < qwerty-options.txt > options.txt
    ```

  * From Dvorak to Qwerty:
    ```
    $ mv options.txt dvorak-options.txt
    $ perl convert.pl dvorak2qwerty < dvorak-options.txt > options.txt
    ```
