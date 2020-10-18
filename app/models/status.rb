class Status < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '新品・未開封' },
    { id: 3, name: '未使用・開封のみ' },
    { id: 4, name: 'ほぼ傷・汚れなし' },
    { id: 5, name: '傷汚れあり・動作問題なし' },
    { id: 6, name: '傷汚れ多い・動作問題あり' },
    { id: 7, name: '不良品・ジャンク' },
  ]
end
