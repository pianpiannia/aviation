<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
	<div class="modal-body">
		<div class="form-group">
			<label for="model"
				class="col-md-3 col-sm-3 col-md-offset-1 control-label right-block">经济舱价格：</label>
			<div class="col-md-4 col-sm-4">
				<label for="model"
					class="col-md-3 col-sm-3 col-md-offset-1 control-label right-block">
					<s:property value="model.tourist_price" />
				</label> <input type="hidden" name="price"
					value="<s:property value="model.tourist_price" />">
			</div>
			<div style="padding-top: 5">
				余<span style="display:inline-block;color: red;width:20;text-align:center"><s:property
							value="model.tourist_number" /></span>票
				
				<s:if test="model.tourist_number!=0">

					<a style="position: absolute;right:80"
						href="${pageContext.request.contextPath }/route_toOrderPage?rid=<s:property value="model.rid" />&&price=<s:property value="model.tourist_price" />">预定</a>
				</s:if>
			</div>
		</div>
	</div>
	<div class="modal-body">
		<div class="form-group">
			<label for="model"
				class="col-md-3 col-sm-3 col-md-offset-1 control-label right-block">头等舱价格：</label>
			<div class="col-md-4 col-sm-4">
				<label for="model"
					class="col-md-3 col-sm-3 col-md-offset-1 control-label right-block"><s:property
						value="model.first_price" /></label> <input type="hidden" name="price"
					value="<s:property value="model.first_price" />">
			</div>
			<div style="padding-top: 5">
				余<span style="display:inline-block;color: red;width:20;text-align:center"><s:property
							value="model.first_number" /></span>票
				
				<s:if test="model.first_number!=0">

					<a	style="position: absolute;right:80"
						href="${pageContext.request.contextPath }/route_toOrderPage?rid=<s:property value="model.rid" />&&price=<s:property value="model.first_price" />">预定</a>
				</s:if>

			</div>
		</div>
	</div>
	<div class="modal-body">
		<div class="form-group">
			<label for="model"
				class="col-md-3 col-sm-3 col-md-offset-1 control-label right-block">商务舱价格：</label>
			<div class="col-md-4 col-sm-4">
				<label for="model"
					class="col-md-3 col-sm-3 col-md-offset-1 control-label right-block"><s:property
						value="model.business_price" /></label> <input type="hidden" name="price"
					value="<s:property value="model.business_price" />">
			</div>
			<div style="padding-top: 5">
				余<span style="display:inline-block;color: red;width:20;text-align:center"><s:property
							value="model.business_number" /></span>票
				
				<s:if test="model.business_number!=0">
					<a	style="position: absolute;right:80"
						href="${pageContext.request.contextPath }/route_toOrderPage?rid=<s:property value="model.rid" />&&price=<s:property value="model.business_price" />">预定</a>
				</s:if>
			</div>
		</div>
	</div>
