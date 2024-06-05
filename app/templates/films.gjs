import { pageTitle } from "ember-page-title";
import Route from "ember-route-template";
import { Request } from '@warp-drive/ember';

import { Spinner } from './components/spinner';
import { RequestError } from './components/error';

export default Route(
  <template>
    {{ (pageTitle "Films") }}

    <Request @request={{@model.request}}>
      <:loading as |state|>
        <Spinner @percentDone={{state.completedRatio}} />
        <button {{on "click" state.abort}}>Cancel</button>
      </:loading>

      <:error as |error state|>
        <RequestError @error={{error}} @state={{state}} />
      </:error>

      <:content as |result|>
        <ul>
          {{#each result.results as |result|}}
          {{log result}}
            <li>
              <h2>{{result.title}}</h2>

              <h3>Starships</h3>
              <ul>
                {{#each result.starships as |starship|}}
                  <li>{{starship}}</li>
                {{/each}}
              </ul>
          </li>
          {{/each}}
        </ul>
      </:content>
    </Request>

  </template>
);
