<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:oxm="https://www.openxsl.com">
    <xsl:template match="/root" name="wurui.user-address-edit">
        <!-- className 'J_OXMod' required  -->
        <div class="J_OXMod oxmod-user-address-edit" ox-mod="user-address-edit">
        	<xsl:variable name="selected_addr_id" select="data/user-select/i[type='user-address']/selected"/>
        	<xsl:variable name="address" select="data/user-address/i[1]"/>

    		<form>
    			<input type="hidden" name="selected_id" value="{$selected_addr_id}"/>
    			<input type="hidden" value="{_id}" name="_id"/>
        		<section>
		            <ul>
		            	<li>
		            		<input class="text" type="text" required="required" placeholder="请输入姓名" value="{$address/name}" name="name"/>
		            	</li>
		            	<li>
		            		<input class="text" type="tel" required="required" placeholder="请输入手机号" value="{$address/phone}" name="phone"/>
		            	</li>
		            	<li class="group">
		            		<p>
		            			<select class="text" name="province" data-value="{$address/province}">
		            				<option><xsl:value-of select="$address/province"/></option>
		            			</select>
		            		</p>
		            		<p>
		            			<select class="text" name="city" data-value="{$address/city}">
		            				<option><xsl:value-of select="$address/city"/></option>
		            			</select>
		            		</p>
		            		<p>
		            			<select class="text" name="district" data-value="{$address/district}">
		            				<option><xsl:value-of select="$address/district"/></option>
		            			</select>
		            		</p>
		            		<!--
		            		<p>
		            			<select class="text">
		            				<option><xsl:value-of select="street"/></option>
		            			</select>
		            		</p>	-->	            	
		            	</li>
		            	<li>
		            		<input class="text" type="text" required="required" placeholder="请输入详细地址" value="{$address/detail}" name="detail"/>
		            	</li>
		            </ul>
		        </section>
		        <section>
            	
		            <p>
		            	
	            		<label>
	            			默认地址
	            			<input type="checkbox" name="is_default" value="1">
	            				<xsl:if test="$selected_addr_id = $address/_id">
	            					<xsl:attribute name="checked">checked</xsl:attribute>
	            				</xsl:if>
	            			</input>
	            		</label>
		            	
		            </p>
			        
	            </section>
	            <section>
	            	<p>
	            		<button class="J_save bt-save">保存</button>
	            	</p>
	            </section>
	            <xsl:if test="$address/_id">
		            <section>
		            	<p>
		            		<button type="button" class="J_del bt-del" data-value="{_id}">删除地址</button>
		            	</p>
		            </section>
	            </xsl:if>
            </form>
	            

            
            
        </div>
    </xsl:template>
</xsl:stylesheet>
