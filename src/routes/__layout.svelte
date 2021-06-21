<script>
  import Header from '$lib/Header/index.svelte'

  // changed up to scss still need to check global for components
  import '../global.scss'
</script>

<Header>
  <main>
    <slot />
  </main>

  <footer>
    <p>visit <a href="https://kit.svelte.dev">kit.svelte.dev</a> to learn SvelteKit</p>
  </footer>

  <style lang="scss">
    main {
      flex: 1;
      display: flex;
      flex-direction: column;
      padding: 1rem;
      width: 100%;
      max-width: 1024px;
      margin: 0 auto;
      box-sizing: border-box;
    }

    footer {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      padding: 40px;
      @media (min-width: 480px) {
        padding: 40px 0;
      }
    }

    footer a {
      font-weight: bold;
    }
  </style>
</Header>
<slot />
