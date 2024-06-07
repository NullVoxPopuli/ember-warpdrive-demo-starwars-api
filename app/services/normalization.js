import { assert } from '@ember/debug';

function identifierForURL(url) {
  let u = new URL(url);
  let path = u.pathname;
  let parts = path.split('/').filter(Boolean);
  let [, /* api */ type, id] = parts;

  return { type, id };
}

export function normalizeRecord(swapiRecord) {
  let record = {
    id: 'not-set',
    type: 'not-set',
    attributes: {},
    relationships: {},
    links: {},
  };

  for (let [key, value] of Object.entries(swapiRecord)) {
    if (key === 'url') {
      assert(`url is not an URL`, isURL(value));

      let url = new URL(value);

      let { type, id } = identifierForURL(url);

      record.type = type;
      record.id = id;

      continue;
    }

    if (Array.isArray(value)) {
      record.relationships[key] = {
        links: {},
        data: [],
      };

      for (let v of value) {
        let { type, id } = identifierForURL(v);

        record.relationships[key] = {
          type,
          id,
        };
      }

      continue;
    }

    if (isURL(value)) {
      let { type, id } = identifierForURL(value);

      record.relationships[key] = {
        links: {},
        data: { type, id },
      };

      continue;
    }

    record.attributes[key] = value;
  }

  return record;
}

export function isURL(maybeUrl) {
  return URL.canParse(maybeUrl);
}
