class Sex < ActiveHash::Base
  self.data = [
    { id: 1, name: '性別を選択して下さい' },
    { id: 2, name: '男性' },
    { id: 3, name: '女性' },
  ]
end
