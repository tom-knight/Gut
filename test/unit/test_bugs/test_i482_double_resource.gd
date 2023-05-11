extends GutTest

class TestTheBasics:
	extends GutTest

	func before_all():
		set_double_strategy(DOUBLE_STRATEGY.SCRIPT_ONLY)

	func test_double_extends_resource():
		var dbl = double(TestI482).new()
		assert_not_null(dbl)

	func test_double_extends_resource_get_something():
		var dbl = double(TestI482).new()
		assert_null(dbl.get_something())

	func test_double_extends_resource_add():
		var dbl = double(TestI482).new()
		assert_null(dbl.add(1, 'a'))

	func test_double_extends_resource_get_something_stubbed_instance():
		var dbl = double(TestI482).new()
		stub(dbl, 'get_something').to_return('nothing')
		assert_eq(dbl.get_something(), 'nothing')

	func test_double_extends_resource_add_stubbed_class():
		stub(TestI482, 'add').to_return('foo')
		var dbl = double(TestI482).new()
		assert_eq(dbl.add(1, 'a'), 'foo')

	func test_partial_double_extends_resource_get_something():
		var dbl = partial_double(TestI482).new()
		assert_eq(dbl.get_something(), 'something')

	func test_partial_double_extends_resource_add():
		var dbl = partial_double(TestI482).new()
		assert_eq(dbl.add(1, 2), 3)



class TestSwitchingFromIncludeSuperToScriptOnly:
	extends GutTest

	func before_all():
		set_double_strategy(DOUBLE_STRATEGY.INCLUDE_SUPER)

	func test_double_extends_resource():
		var dbl = double(TestI482, DOUBLE_STRATEGY.SCRIPT_ONLY).new()
		assert_not_null(dbl)
