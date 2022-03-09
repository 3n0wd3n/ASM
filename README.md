# ASM

Pro to abychom byli schopni to spustit na Windowsech musíme udělat následující.

Mingw64 je využití zabudované linuxové komponenty "Windows Subsystem for Linux", jedná se vlastně o zabudovaný plnohodnotný linuxový terminál ve Windowsu (je potřeba alespoň Windows 10)

Pro instalaci je potřeba zajistit 2 věci:
 - Zapnutí komponenty WSL
   - Spusťte "Ovládací panely", klikněte na "Programy" a zvolte možnost "Zapnout nebo vypnout funkce Windows"
   - V tomto okně najděte a zatrhněte "Subsystém Windows pro Linux"
   - Tento proces vyžaduje restart systému, takže si vše důležité uložte než spustíte instalaci této komponenty

 - Instalace samotné Linuxové distribuce
   - Otevřete aplikaci "Microsoft Store"
   - Najděte libovolnou Linuxovou distribuci (např. "Ubuntu 20.04" - https://www.microsoft.com/cs-cz/p/ubuntu-2004/9n6svws3rx71)
   - Nainstalujte zvolenou distribuci, spusťte ji a projděte instalací (pro spuštění je potřeba zapnutá komponenta WSL z minulého kroku)

Výhodou oproti výše zmíněnému postupu s mingw je, že se jedná o plnohodnotný Linux (tedy problém s jinými registry při čtení argumentů vůbec nevzniká), navíc všechny příkazy se vykonávají úplně stejně, jako jsou zapsané v materiálech (tedy není potřeba psát "mingw32-make", stačí napsat "make") a instalace je oproti mingw metodě triviální.

    stačí napsat -> $ sudo apt update && sudo apt install gcc make
    potom ještě bude postřeba -> $ sudo apt install nasm
Potom když máme soubor main.c, demo.asm, Makefile stačí už jen do konzole napsat
    
    $ make -f Makefile
    $ ./main

Co taky doporučuju je gedit

    $ sudo apt install gedit
