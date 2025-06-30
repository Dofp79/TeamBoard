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
// Abfrage:    dim_Zeit
// Typ:        Power Query (M)
// Projekt:    TeamBoard_1.0.0
// Autor:      Doniman Francisco Peña Parra
// Erstellt:   30.06.2025
// Zweck:      Erstellung einer Zeitdimension mit stündlicher Granularität
// Beschreibung:
//   - Erstellt für den Zeitraum 01.01.2023 bis 31.12.2026 alle Zeitstempel im Stundentakt
//   - Ergänzt Spalten für Datum, Stunde, Arbeitstag, Wochentag
//   - Grundlage für DAX-Maßzahlen mit Zeitbezug (z. B. Netto_Kapazitätsstunden)
// Datenschutz:
//   - Enthält keine personen- oder aufgabenbezogenen Informationen
// ITIL 4 - Prinzipien:
//   - Halte es einfach und praktisch
//   - Optimiere und automatisiere
// ---------------------------------------------------------------------
