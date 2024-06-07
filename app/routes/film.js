import Route from '@ember/routing/route';
import { service } from '@ember/service';
import { findRecord } from '@ember-data/rest/request';

export default class Film extends Route {
  @service('store') store;

  async model({ id }) {
    let request = this.store.request(
      findRecord({
        id,
        type: 'films',
      }),
    );

    return { request };
  }
}
