
#include <windows.h>
#include <tchar.h>
#include <stdio.h>

#define COUNT (20)

DWORD WINAPI ThreadFunc(LPVOID lpParam)
{
    _tprintf(_T("Spusteno vlakno s id: %i\n"), GetCurrentThreadId());
    DWORD x = *(DWORD *)lpParam;
    for (int i = 0; i < COUNT; i++) {
        _tprintf(_T("thr #%i: %i\n"), x, i);
        Sleep(1);
    }

    return 0;
}

int _tmain()
{
    DWORD dwThreadId;
    DWORD dwThrdParam = 1;

    HANDLE hThread = CreateThread(
        NULL, // bezpecnostni atributy
        0, // velikost zasobniku (0 -> implicitni hodnota)
        ThreadFunc, // funkce provadena vlakna
        &dwThrdParam, // argument predany vlaknu
        0, // priznaky pro vytvorene vlakno
        &dwThreadId); // vraci id vlakna

    if (hThread == NULL) {
        _tprintf(_T("Vytvoreni vlakna selhalo\n"));
        ExitProcess(0);
    } else {
        _tprintf(_T("Vytvoreno vlakno s id: %i\n"), dwThreadId);
    }

    for (int i = 0; i < COUNT; i++) {
        _tprintf(_T("thr #0: %i\n"), i);
        Sleep(1);
    }

    WaitForSingleObject(hThread, INFINITE); // ceka na skonceni vlakna
    CloseHandle(hThread); // ukonci praci s vlaknem
}
