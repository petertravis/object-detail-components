# object-detail-components

Composable component library for object detail views — field primitives, semantic groupings, and layout primitives. Pure CSS classes + semantic HTML, no framework, no build step.

**Live showcase:** https://petertravis.github.io/object-detail-components/

## Structure

```
index.html       ← showcase / explorer page
tokens.css       ← design tokens (colors, motion)
components.css   ← all component styles
showcase.js      ← showcase interactivity (detail-pane open/close)
```

## Component taxonomy

- **Field renderers** — atomic label + value pairs (`FieldText`, `FieldBadge`, `FieldDate`, `FieldUser`, `FieldCurrency`, `FieldDropdown`, `FieldTags`, `FieldNumber`, `FieldDatetime`, `FieldDuration`, `FieldLocation`, `FieldAddress`, `FieldReference`, `FieldRichText`, `FieldBoolean`, `FieldEmail`, `FieldPhone`, `FieldRating`, `FieldLink`, `FieldFile`, `FieldProgress`, `FieldAutoNumber`)
- **Semantic groupings** — clusters with a visual treatment (`FieldSection`, `StatRow`, `PeopleList`, `ActivityFeed`, `AssetList`, `RelatedRecords`, `HeaderGrouping`, `EntityCardGrouping`, `TextBlockGrouping`, `ChecklistGrouping`, `MediaGrouping`, `MapGrouping`, `TableGrouping`, `StageStepperGrouping`, `StageProgressGrouping`)
- **Layout primitives** — spatial containers (`RecordHeader`, `CommentBar`, `SectionDivider`, `DetailPane`, `DetailPage`, `ListLayout`, `BoardLayout`, `DashboardLayout`, `PipelineLayout`, `CalendarLayout`, `TimelineLayout`)

## Run locally

```sh
npx serve .
```

Then open the showcase URL the CLI prints.
