Ø_Kapazität_je_Aufgabe = 
AVERAGE(fact_TeamBoard_IT32[Time Invest])

// ---------------------------------------------------------------------
// Dokumentation
// Measure:    Ø_Kapazität_je_Aufgabe
// Typ:        Measure
// Tabelle:    Measure
// Projekt:    TeamBoard_1.0.0
// Autor:      Doniman Francisco Peña Parra
// Erstellt:   30.06.2025
// Zweck:      Durchschnittlicher Zeitaufwand je Task im Teamboard
// Beschreibung:
//   - Ermittelt den Mittelwert der erfassten Time-Invest-Zeit je Eintrag
//   - Nutzt das Feld [Time Invest] aus der Tabelle fact_TeamBoard_IT32
// Datenschutz:
//   - Keine personenbezogenen Daten, rein objektbezogene Bewertung
// ITIL 4 - Prinzipien:
//   - Beginne dort, wo du stehst
//   - Fokussiere dich auf den Wert
//   - Halte es einfach und praktisch
// ------------------------------------------------------------------------------------------------
//| Visual                                    | Beschreibung                                       |
//| ----------------------------------------- | -------------------------------------------------- |
//| KPI-Card: **Ø\_Kapazität\_je\_Aufgabe**   | Gibt den Aufwand je Item wieder                    |
//| Liniendiagramm: `Created` → `Time Invest` | Zeigt Arbeitsbelastungstrend nach Monat            |
//| Balken: `Status` → `# Aufgaben`           | WIP/Done/Backlog Verteilung                        |
//| Matrix: `Team` × `Status`                 | Vergleich: Team-Auslastung / Fortschritt je Team   |
//| Clustered Bar: `Prio` → `Time Invest`     | Zeigt ob hohe Prioritäten mehr Aufwand verursachen |
//|------------------------------------------------------------------------------------------------|
