return {
  'CKolkey/ts-node-action',
  opts = {
    --
  },
  keys = {
    {
      '<leader>A',
      function()
        require('ts-node-action').node_action()
      end,
      desc = 'Treesitter node action',
    },
  },
}
