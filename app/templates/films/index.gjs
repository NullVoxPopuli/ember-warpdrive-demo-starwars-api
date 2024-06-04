import { pageTitle } from "ember-page-title";
import Route from "ember-route-template";

export default Route(
  <template>
    <ul>
      {{#each @model.results as |result|}}
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
  </template>
);
