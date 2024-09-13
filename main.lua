-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf("no")

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then
  require("mobdebug").start()
end

-- Chargement des images
local lstSprites = {}

local imgTiles = {}
imgTiles["1"] = love.graphics.newImage("_ressources_/images/tile1.png")
imgTiles["2"] = love.graphics.newImage("_ressources_/images/tile2.png")
imgTiles["3"] = love.graphics.newImage("_ressources_/images/tile3.png")
imgTiles["4"] = love.graphics.newImage("_ressources_/images/tile4.png")
imgTiles["5"] = love.graphics.newImage("_ressources_/images/tile5.png")

local map = {}
map[1] = "1111111111111111111111111"
map[2] = "1000000000000000000000001"
map[3] = "1000111111111111111110001"
map[4] = "1000000000000000000000011"
map[5] = "1000000000000000000000001"
map[6] = "1000000000000000000000111"
map[7] = "1000000000000000000000001"
map[8] = "1000000000000000011111111"
map[9] = "1000000000000000000000001"
map[10] = "1000000000000000000000001"
map[11] = "1000000000111100000000001"
map[12] = "1000000000000000000000001"
map[13] = "1111111000000000000000001"
map[14] = "1000000000000000000000001"
map[15] = "1000000000111100000000001"
map[16] = "1000000001000010000000001"
map[17] = "1000000010000001000000001"
map[18] = "1111111111111111111111111"

function ChargeNiveau(pNum)
  map = {}
  if pNum == 1 then
    map[1] = "1111111111111111111111111"
    map[2] = "1000000000000000000000001"
    map[3] = "1000111111111111111110001"
    map[4] = "1000000000000000000000011"
    map[5] = "1000000000000000000000001"
    map[6] = "1000000000000000000000111"
    map[7] = "1000000000000000000000001"
    map[8] = "1000000000000000011111111"
    map[9] = "1000000000000000000000001"
    map[10] = "1000000000000000000000001"
    map[11] = "1000000000111100000000001"
    map[12] = "1000000000000000000000001"
    map[13] = "1111111000000000000000001"
    map[14] = "1000000000000000000000001"
    map[15] = "1000000000111100000000001"
    map[16] = "1000000001000010000000001"
    map[17] = "1000000010000001000000001"
    map[18] = "1111111111111111111111111"

    level = {}
    level.playerStart.col = 2
    level.playerStart.lig = 14
  elseif pNum == 2 then
    map[1] = "1111111111111111111111111"
    map[2] = "4000000000000000000000005"
    map[3] = "4000000000000000000000005"
    map[4] = "4000000000000000000000005"
    map[5] = "4000000000000000000000005"
    map[6] = "4000000000000000000000005"
    map[7] = "4000000000000000000000005"
    map[8] = "4000000000000000000000005"
    map[9] = "4000000000000000000000005"
    map[10] = "4000000000000000000000005"
    map[11] = "4000000000000000000000005"
    map[12] = "4000000000000000000000005"
    map[13] = "4000000000000000000000005"
    map[14] = "4000000000000000000000005"
    map[15] = "4000000000000000000000005"
    map[16] = "4000000000000000000000005"
    map[17] = "4000000000000000000000005"
    map[18] = "1111111111111111111111111"
  end
end

function InitGame(pNiveau)
  lstSprites = {}
  ChargeNiveau(pNiveau)

  -- CreateSprite("Player", (level.playerStart.col - 1) * 32, (level.player.start.lig - 1) * 32)
end

function CreateSprite(pType, pX, pY)
  local mySprite = {}

  mySprite.x = pX
  mySprite.y = pY
  mySprite.vx = 0
  mySprite.vy = 0
  mySprite.frame = 0
  mySprite.type = pType
  mySprite.standing = false

  table.insert(lstSprites, mySprite)

  return mySprite
end

-- fonction très utile qui reçoit une position en pixel et retourne le caractères de la map se trouvant à cette position
function getTileAt(pX, pY)
  local col = math.floor(pX / 32) + 1
  local lig = math.floor(pY / 32) + 1
  if col > 0 and col <= #map[1] and lig > 0 and lig <= #map then
    local id = string.sub(map[lig], col, col)
    return id
  end
  return 0
end

function love.load()
  width = love.graphics.getWidth()
  height = love.graphics.getHeight()
  print("Screen size is " .. width .. "," .. height)
  love.window.setTitle("Mini platformer (c) Gamecodeur 2017")
  InitGame(2)
end

function love.update(dt)
end

function love.draw()
  for l = 1, #map do
    for c = 1, #map[1] do
      local char = string.sub(map[l], c, c)
      if char ~= "0" then
        love.graphics.draw(imgTiles[char], (c - 1) * 32, (l - 1) * 32)
      end
    end
  end

  local id = getTileAt(love.mouse.getX(), love.mouse.getY())
  love.graphics.print(id)
end

function love.keypressed(key)
  print(key)
end
