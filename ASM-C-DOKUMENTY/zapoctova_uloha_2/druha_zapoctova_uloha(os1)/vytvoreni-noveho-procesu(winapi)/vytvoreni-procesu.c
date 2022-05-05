#include <windows.h>
#include <tchar.h>

int _tmain(int argc, TCHAR* argv[])
{
    STARTUPINFO si;
    PROCESS_INFORMATION pi;
    ZeroMemory(&si, sizeof(si));
    si.cb = sizeof(si);
    ZeroMemory(&pi, sizeof(pi));
    // vytvori novy proces
    if (!CreateProcess(
    _T("C:\\WINDOWS\\system32\\notepad.exe"), // cesta k programu
    _T("C:\\WINDOWS\\system32\\notepad.exe foo.txt"), // uplny seznam argumentu
    NULL, // nastaveni bezpecnostnich atributu
    NULL, // nastaveni bezpecnostnich atributu
    FALSE, // zakaz dedeni handlu meyi procesz
    0, // priznaky pro vytvoreni procesu
    NULL, // definice prostredi (pouzije se prostredi aktualniho procesu)
    NULL, // pracovni adresar (pouzije se adresar aktualniho procesu)
    &si, // ukazatel na strukturu s informacemi ke spoustenumu procesu
    &pi) // ukazatel na strukturu, kterou jsou predany informace o vzniklem procesu
    ) {
        _tprintf(_T("CreateProcess failed (%d).\n"), GetLastError());
        return 1;
    }
    // ceka na ukonceni procesu
    WaitForSingleObject(pi.hProcess, INFINITE);
    // uzavre proces
    CloseHandle(pi.hProcess);
    CloseHandle(pi.hThread);
    return 0;
}
