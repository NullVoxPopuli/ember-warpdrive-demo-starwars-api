import { LinkTo } from '@ember/routing';

import { pageTitle } from "ember-page-title";
import Route from "ember-route-template";

export default Route(
  <template>
    {{pageTitle "StarWars API"}}

    <nav>
      <LinkTo @route="films">Films</LinkTo>
      <LinkTo @route="people">People</LinkTo>
      <LinkTo @route="planets">Planets</LinkTo>
      <LinkTo @route="species">Species</LinkTo>
      <LinkTo @route="starships">Starships</LinkTo>
      <LinkTo @route="vehicles">Vehicles</LinkTo>
    </nav>

    {{outlet}}

    <style>
      nav { display: flex; gap: 1rem; }
    </style>
  </template>
);
