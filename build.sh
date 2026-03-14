name: Build OpenChrome
on: [push]

jobs:
  create-iso:
    runs-on: ubuntu-latest
    steps:
      # Usiamo la v4 che usa Node.js 24, così il warning sparisce
      - name: Checkout del codice
        uses: actions/checkout@v4
          
      - name: Prepara Ambiente
        run: |
          sudo apt update
          sudo apt install -y squashfs-tools xorriso
          
      - name: Costruisci OpenChrome
        run: |
          chmod +x build.sh
          # Eseguiamo lo script
          sudo ./build.sh
          # Creiamo un file di prova per essere SICURI di vedere qualcosa negli Artifacts
          echo "Build di OpenChrome completata con successo da Gabriele!" > successo.txt
          
      - name: Carica i file (Artifacts)
        uses: actions/upload-artifact@v4
        with:
          name: OpenChrome-Pacchetto-Finale
          path: |
            successo.txt
            *.iso
            *.txt

