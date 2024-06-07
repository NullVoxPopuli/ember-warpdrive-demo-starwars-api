import Route from '@ember/routing/route';
import { service } from '@ember/service';
import { query } from '@ember-data/rest/request';

export default class Films extends Route {
  @service('store') store;

  async model() {
    let request = this.store.request(query('film'));

    return { request };
  }
}
