unit KeyUser;
{
  element 5 AG / ShareIt!
  key generator interface
  version 2.6

  IMPLEMENT YOUR CODE HERE!
}

interface

{ KEYGEN.dll prototypes }
{$I INCLUDE\KEYGEN.INC}

// tytul okienka
const Title = 'PELock - przyklad generacji kluczy licencyjnych';

function GenerateBinKey(var name, mime, bin: string): integer;

implementation

uses
  KeyIntfBin, SysUtils;

// procedura generacji klucza licencyjnego
function GenerateBinKey(var name, mime, bin: string): integer;
var
  iKeySize    : integer;
  Status      : integer;
  ProjectPath : string;

begin

  gList.Names [1];

  name := 'key.lic';                   // domyslna nazwa pliku licencyjnego
  mime := 'application/octet-stream';  // typ danych binarnych

  // ustaw domyslny rozmiar bufor na dane licencyjne (4KB)
  SetLength(bin,4096);

  // utworz pelna sciezke pliku projektu (ktory powinien znajdowac
  // sie w katalogu z programem)
  ProjectPath := PChar(ExtractFilePath(ParamStr(0))+'test.plk');

  // generuj dane klucza
  Status := Keygen( PChar(Value('REG_NAME')), // nazwa uzytkownika (PChar)
                    0,                        // dodatkowe dane klucza (DWORD)
                    Nil,                      // sprzetowy identyfikator klucza (PChar)
                    Nil,                      // data wygasniecia klucza (SYSTEMTIME)
                    PChar(bin),               // bufor na dane klucza (array of byte)
                    @iKeySize,                // rozmiar danych klucza (wyjscie) (DWORD)
                    PChar(ProjectPath),       // pelna sciezka do pliku projektu (PChar)
                    FALSE);                   // flaga aktualizacji projektu (BOOL)

  // ustaw wyjsciowy rozmiar danych klucza licencyjnego
  SetLength(bin,iKeySize);

  case Status of
  // klucz zostal poprawnie wygenerowany, zwroc odpowiednia wartosc
  KEYGEN_OK       : result:= ERC_SUCCESS_BIN;

  // blad inicjalizacji, najprawdopodobniej byla podana niepoprawna
  // sciezka do pliku projektu
  KEYGEN_INIT_ERR : result:= ERC_INTERNAL;

  // blad podczas generacji danych licencyjnych (bledna nazwa uzytkownika?)
  KEYGEN_DATA_ERR : result:= ERC_BAD_INPUT;

  else
  // wszystkie inne bledy obslugiwane sa tutaj
  result:= ERC_INTERNAL;
  end;


end;

end.



