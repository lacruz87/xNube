require 'test_helper'

class InventariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inventario = inventarios(:one)
  end

  test "should get index" do
    get inventarios_url
    assert_response :success
  end

  test "should get new" do
    get new_inventario_url
    assert_response :success
  end

  test "should create inventario" do
    assert_difference('Inventario.count') do
      post inventarios_url, params: { inventario: { create: @inventario.create, expire: @inventario.expire, ln: @inventario.ln, loc: @inventario.loc, loc_des: @inventario.loc_des, lot: @inventario.lot, part: @inventario.part, qty_all: @inventario.qty_all, qty_oh: @inventario.qty_oh, ref: @inventario.ref, site: @inventario.site, site_desc: @inventario.site_desc, status: @inventario.status } }
    end

    assert_redirected_to inventario_url(Inventario.last)
  end

  test "should show inventario" do
    get inventario_url(@inventario)
    assert_response :success
  end

  test "should get edit" do
    get edit_inventario_url(@inventario)
    assert_response :success
  end

  test "should update inventario" do
    patch inventario_url(@inventario), params: { inventario: { create: @inventario.create, expire: @inventario.expire, ln: @inventario.ln, loc: @inventario.loc, loc_des: @inventario.loc_des, lot: @inventario.lot, part: @inventario.part, qty_all: @inventario.qty_all, qty_oh: @inventario.qty_oh, ref: @inventario.ref, site: @inventario.site, site_desc: @inventario.site_desc, status: @inventario.status } }
    assert_redirected_to inventario_url(@inventario)
  end

  test "should destroy inventario" do
    assert_difference('Inventario.count', -1) do
      delete inventario_url(@inventario)
    end

    assert_redirected_to inventarios_url
  end
end
