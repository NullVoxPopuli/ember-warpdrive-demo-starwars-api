import JSONAPICache from '@ember-data/json-api';
import RequestManager from '@ember-data/request';
import Fetch from '@ember-data/request/fetch';
import { LifetimesService } from '@ember-data/request-utils';
import Store, { CacheHandler } from '@ember-data/store';

import {
  instantiateRecord,
  teardownRecord,
} from '@warp-drive/schema-record/hooks';
import {
  registerDerivations,
  SchemaService,
} from '@warp-drive/schema-record/schema';

import { normalizeRecord } from './normalization';
import { registerStaticResources } from './resource-schemas';

const SWAPI_TO_JSONAPI = {
  /**
   * Manually hook up streams to support the Request
   * component's progress and other advanced featuers.
   */
  async request({ request }, next) {
    let response = await next(request);

    let swapiResponse = response.content;

    if (Array.isArray(swapiResponse.results)) {
      return {
        data: swapiResponse.results.map(normalizeRecord),
        included: [],
      };
    }

    return {
      data: normalizeRecord(swapiResponse),
      included: [],
    };
  },
};

export default class StarWarsStore extends Store {
  constructor(args) {
    super(args);

    this.requestManager = new RequestManager();
    this.requestManager.use([SWAPI_TO_JSONAPI, Fetch]);
    this.requestManager.useCache(CacheHandler);
    this.lifetimes = new LifetimesService({
      apiCacheHardExpires: 120 * 1000,
      apiCacheSoftExpires: 60 * 1000,
    });
  }

  request = (...args) => this.requestManager.request(...args);

  createSchemaService() {
    const schema = new SchemaService();

    registerDerivations(schema);
    registerStaticResources(schema);

    return schema;
  }

  createCache(capabilities) {
    return new JSONAPICache(capabilities);
  }

  instantiateRecord(identifier, createArgs) {
    return instantiateRecord(this, identifier, createArgs);
  }

  teardownRecord(record) {
    return teardownRecord(record);
  }
}
