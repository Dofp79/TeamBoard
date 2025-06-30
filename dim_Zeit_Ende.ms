let
    StartDatum = #datetime(2023, 1, 1, 0, 0, 0),
    EndDatum = #datetime(2026, 12, 31, 23, 0, 0),
    AnzahlStunden = Duration.Hours(EndDatum - StartDatum) + 1,
    Tabelle = List.Transform({0..AnzahlStunden-1}, each StartDatum + #duration(0, _, 0, 0)),
    InTabelle = Table.FromList(Tabelle, Splitter.SplitByNothing(), {"Zeitstempel"}),
    MitStunde = Table.AddColumn(InTabelle, "Stunde", each Date.Hour([Zeitstempel])),
    MitDatum = Table.AddColumn(MitStunde, "Datum", each DateTime.Date([Zeitstempel])),
    MitWochentag = Table.AddColumn(MitDatum, "Wochentag", each Date.DayOfWeekName([Datum])),
    MitArbeitstag = Table.AddColumn(MitWochentag, "IstArbeitstag", each Date.DayOfWeek([Datum], Day.Monday) < 5)
in
    MitArbeitstag

// ---------------------------------------------------------------------
// Dokumentation
// Abfrage:    dim_Zeit_Ende
// Typ:        Power Query (M)
// Projekt:    TeamBoard_1.0.0
// Autor:      Doniman Francisco Peña Parra
// Erstellt:   30.06.2025
// Zweck:      Erstellung einer zweiten Zeitdimension für Endzeiten
// Beschreibung:
//   - Enthält stündliche Zeitstempel von 01.01.2023 bis 31.12.2026
//   - Wird zur Analyse von Modified-Zeitpunkten verwendet
//   - Strukturell identisch mit dim_Zeit, aber unabhängig
// Datenschutz:
//   - Keine personenbezogenen Daten enthalten
// ITIL 4 - Prinzipien:
//   - Halte es einfach und praktisch
//   - Beginne dort, wo du stehst
// ---------------------------------------------------------------------
