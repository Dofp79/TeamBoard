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


Netto_Kapazitätsstunden =
VAR Startzeit = SELECTEDVALUE(fact_TeamBoard_IT32[Created])
VAR Endzeit   = SELECTEDVALUE(fact_TeamBoard_IT32[Modified])

RETURN
CALCULATE (
    COUNTROWS ( dim_Zeit ),
    dim_Zeit[Zeitstempel] >= Startzeit,
    dim_Zeit[Zeitstempel] <= Endzeit,
    dim_Zeit[IstArbeitstag] = TRUE,
    dim_Zeit[Stunde] >= 8,
    dim_Zeit[Stunde] < 20
)

// ---------------------------------------------------------------------
// Dokumentation
// Measure:    Netto_Kapazitätsstunden
// Typ:        Measure
// Tabelle:    Measure
// Projekt:    TeamBoard_1.0.0
// Autor:      Doniman Francisco Peña Parra
// Erstellt:   30.06.2025
// Zweck:      Berechnung der realen Kapazitätsstunden je Eintrag (Teamboard)
// Beschreibung:
//   - Nutzt die Spalten [Created] und [Modified] aus fact_TeamBoard_IT32
//   - Berücksichtigt nur Arbeitszeit zwischen 08:00–20:00 Uhr an Werktagen
//   - Nutzt dim_Zeit zur stündlichen Auflösung
// Datenschutz:
//   - Keine personenbezogenen Daten verwendet
//   - Vollständig auf Teamebene aggregierbar
// ITIL 4 - Prinzipien:
//   - Beginne dort, wo du stehst
//   - Fokussiere dich auf den Wert
//   - Halte es einfach und praktisch
// ---------------------------------------------------------------------
