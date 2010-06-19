/*
 * Copyright (c) 2007-2009-2010 the original author or authors
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package org.as3commons.reflect {

	import flexunit.framework.TestCase;

	/**
	 * @author Christophe Herreman
	 */
	public class MetaDataContainerTest extends TestCase {

		/**
		 * Creates a new MetaDataContainerTest.
		 */
		public function MetaDataContainerTest(methodName:String = null) {
			super(methodName);
		}


		public function testHasMetaData_shouldReturnTrueIfMetaDataWasFound():void {
			var metaDataContainer:MetaDataContainer = new MetaDataContainer();
			metaDataContainer.addMetaData(new MetaData("testMetaData"));
			assertTrue(metaDataContainer.hasMetaData("testMetaData"));
		}

		public function testHasMetaData_shouldReturnFalseIfNoMetaDataWasFound():void {
			var metaDataContainer:MetaDataContainer = new MetaDataContainer();
			metaDataContainer.addMetaData(new MetaData("testMetaData"));
			assertFalse(metaDataContainer.hasMetaData("nonExistingMetaData"));
		}

		public function testHasExactMetaData_shouldReturnTrueIfMatchingMetaDataWasFound():void {
			var metaDataContainer:MetaDataContainer = new MetaDataContainer();
			var tm:MetaData = new MetaData("testMetaData");
			tm.arguments.push(new MetaDataArgument("testKey", "testValue"));
			metaDataContainer.addMetaData(tm);
			var tm2:MetaData = new MetaData("testMetaData");
			tm2.arguments.push(new MetaDataArgument("testKey", "testValue"));
			assertTrue(metaDataContainer.hasExactMetaData(tm2));
		}

		public function testHasExactMetaData_shouldReturnFalseIfNoMatchingMetaDataWasFound():void {
			var metaDataContainer:MetaDataContainer = new MetaDataContainer();
			metaDataContainer.addMetaData(new MetaData("testMetaData"));
			var tm:MetaData = new MetaData("testMetaData");
			tm.arguments.push(new MetaDataArgument("testKey", "testValue"));
			assertFalse(metaDataContainer.hasExactMetaData(tm));
		}


	}
}