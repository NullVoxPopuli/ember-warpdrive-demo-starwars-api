export const RequestError = <template>
  {{log @error}}

  <p>
    {{@error}}
  </p>

  <button {{on "click" @state.retry}}>Retry</button>
</template>
