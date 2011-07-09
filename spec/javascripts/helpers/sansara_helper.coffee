window.mockSandboxTemplate = ->
  buildLi = ->
    li = $('<li>')
    image = $('<img>').attr('src', 'http://placekitten.com/250/200')
    li.html image
  ul = $('<ul>').attr('id', 'sansara')
  for time in [1..5]
    do -> ul.append buildLi()
  ul

window.mockSandbox = ->
  setFixtures mockSandboxTemplate()
  $('#sansara')

window.apiMock = (params = {})->
  new Sansara.Api mockSandbox(), params

window.sansaraMock = (params = {}) ->
  element = $(mockSandbox()).sansara params
  element.data('sansara')