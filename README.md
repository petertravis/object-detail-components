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
- **Semantic groupings** — clusters with a visual treatment (`FieldSection`, `StatRow`, `StatStrip`, `PeopleList`, `ActivityFeed`, `AssetList`, `RelatedRecords`, `HeaderGrouping`, `EntityCardGrouping`, `TextBlockGrouping`, `ChecklistGrouping`, `MediaGrouping`, `MapGrouping`, `TableGrouping`, `StageStepperGrouping`, `StageProgressGrouping`, `Tabs`, `TaskList`)
- **Layout primitives** — spatial containers (`RecordHeader`, `CommentBar`, `SectionDivider`, `DetailPane`, `DetailPage`, `ListLayout`, `BoardLayout`, `DashboardLayout`, `PipelineLayout`, `CalendarLayout`, `TimelineLayout`)

## Run locally

```sh
npx serve .
```

Then open the showcase URL the CLI prints.

## Publishing updates

The current library version is tracked in the `VERSION` file. Consumers link CSS with a cache-bust query param (e.g. `components.css?v=2`) so browsers refetch when the library ships a new version.

**Ritual — every time you change `tokens.css` or `components.css`:**

```sh
./publish.sh              # bump VERSION, update ?v=N in index.html, prints commit/push steps
# — or —
./publish.sh --push "Add ProjectHeader + FileList components"
                          # bump, commit, and push in one shot
```

Then in any consumer app (e.g. `buzz.html`), bump the `?v=N` on the `<link rel="stylesheet">` URLs to pick up the new version:

```html
<link rel="stylesheet" href="https://petertravis.github.io/object-detail-components/tokens.css?v=3">
<link rel="stylesheet" href="https://petertravis.github.io/object-detail-components/components.css?v=3">
```

Consumers pin to a specific version so a library bump can't surprise-break their app — they bump when they're ready to consume the new components.

**Sanity check on-disk version:** the first line of each CSS file has a `/* vN · ... */` header that `publish.sh` keeps in sync with `VERSION`.
