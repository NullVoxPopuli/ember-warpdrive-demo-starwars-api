import Route from '@ember/routing/route';
import { service } from '@ember/service';

export default class Film extends Route {
  @service('request') manager;

  async model({ id }) {
    let request = this.manager.request({
      url: `/films/${id}`,
    });

    return { request };
  }
}
