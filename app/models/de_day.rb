class DeDay < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '1-2日' },
    { id: 3, name: '3-5日' },
    { id: 4, name: '4-7日' },
  ]
end
