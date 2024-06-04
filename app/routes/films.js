import Route from '@ember/routing/route';
import { service } from '@ember/service';

export default class Films extends Route {
  @service('request') manager;

  async model() {
    const request = await this.manager.request({
      url: '/films'
    });

    return request.content;
  }
}
