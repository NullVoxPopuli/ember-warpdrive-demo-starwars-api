import { withDefaults } from '@warp-drive/schema-record/schema';

const Film = withDefaults({
  type: 'film',
  fields: [
    {
      name: 'title',
      kind: 'field',
    },
  ],
});

export function registerStaticResources(schema) {
  schema.registerResource(Film);
}
