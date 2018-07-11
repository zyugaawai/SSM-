package cn.tf.ecps.po;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class EbItemExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public EbItemExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andItemIdIsNull() {
            addCriterion("ITEM_ID is null");
            return (Criteria) this;
        }

        public Criteria andItemIdIsNotNull() {
            addCriterion("ITEM_ID is not null");
            return (Criteria) this;
        }

        public Criteria andItemIdEqualTo(Long value) {
            addCriterion("ITEM_ID =", value, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdNotEqualTo(Long value) {
            addCriterion("ITEM_ID <>", value, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdGreaterThan(Long value) {
            addCriterion("ITEM_ID >", value, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdGreaterThanOrEqualTo(Long value) {
            addCriterion("ITEM_ID >=", value, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdLessThan(Long value) {
            addCriterion("ITEM_ID <", value, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdLessThanOrEqualTo(Long value) {
            addCriterion("ITEM_ID <=", value, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdIn(List<Long> values) {
            addCriterion("ITEM_ID in", values, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdNotIn(List<Long> values) {
            addCriterion("ITEM_ID not in", values, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdBetween(Long value1, Long value2) {
            addCriterion("ITEM_ID between", value1, value2, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdNotBetween(Long value1, Long value2) {
            addCriterion("ITEM_ID not between", value1, value2, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemNameIsNull() {
            addCriterion("ITEM_NAME is null");
            return (Criteria) this;
        }

        public Criteria andItemNameIsNotNull() {
            addCriterion("ITEM_NAME is not null");
            return (Criteria) this;
        }

        public Criteria andItemNameEqualTo(String value) {
            addCriterion("ITEM_NAME =", value, "itemName");
            return (Criteria) this;
        }

        public Criteria andItemNameNotEqualTo(String value) {
            addCriterion("ITEM_NAME <>", value, "itemName");
            return (Criteria) this;
        }

        public Criteria andItemNameGreaterThan(String value) {
            addCriterion("ITEM_NAME >", value, "itemName");
            return (Criteria) this;
        }

        public Criteria andItemNameGreaterThanOrEqualTo(String value) {
            addCriterion("ITEM_NAME >=", value, "itemName");
            return (Criteria) this;
        }

        public Criteria andItemNameLessThan(String value) {
            addCriterion("ITEM_NAME <", value, "itemName");
            return (Criteria) this;
        }

        public Criteria andItemNameLessThanOrEqualTo(String value) {
            addCriterion("ITEM_NAME <=", value, "itemName");
            return (Criteria) this;
        }

        public Criteria andItemNameLike(String value) {
            addCriterion("ITEM_NAME like", value, "itemName");
            return (Criteria) this;
        }

        public Criteria andItemNameNotLike(String value) {
            addCriterion("ITEM_NAME not like", value, "itemName");
            return (Criteria) this;
        }

        public Criteria andItemNameIn(List<String> values) {
            addCriterion("ITEM_NAME in", values, "itemName");
            return (Criteria) this;
        }

        public Criteria andItemNameNotIn(List<String> values) {
            addCriterion("ITEM_NAME not in", values, "itemName");
            return (Criteria) this;
        }

        public Criteria andItemNameBetween(String value1, String value2) {
            addCriterion("ITEM_NAME between", value1, value2, "itemName");
            return (Criteria) this;
        }

        public Criteria andItemNameNotBetween(String value1, String value2) {
            addCriterion("ITEM_NAME not between", value1, value2, "itemName");
            return (Criteria) this;
        }

        public Criteria andItemNoIsNull() {
            addCriterion("ITEM_NO is null");
            return (Criteria) this;
        }

        public Criteria andItemNoIsNotNull() {
            addCriterion("ITEM_NO is not null");
            return (Criteria) this;
        }

        public Criteria andItemNoEqualTo(String value) {
            addCriterion("ITEM_NO =", value, "itemNo");
            return (Criteria) this;
        }

        public Criteria andItemNoNotEqualTo(String value) {
            addCriterion("ITEM_NO <>", value, "itemNo");
            return (Criteria) this;
        }

        public Criteria andItemNoGreaterThan(String value) {
            addCriterion("ITEM_NO >", value, "itemNo");
            return (Criteria) this;
        }

        public Criteria andItemNoGreaterThanOrEqualTo(String value) {
            addCriterion("ITEM_NO >=", value, "itemNo");
            return (Criteria) this;
        }

        public Criteria andItemNoLessThan(String value) {
            addCriterion("ITEM_NO <", value, "itemNo");
            return (Criteria) this;
        }

        public Criteria andItemNoLessThanOrEqualTo(String value) {
            addCriterion("ITEM_NO <=", value, "itemNo");
            return (Criteria) this;
        }

        public Criteria andItemNoLike(String value) {
            addCriterion("ITEM_NO like", value, "itemNo");
            return (Criteria) this;
        }

        public Criteria andItemNoNotLike(String value) {
            addCriterion("ITEM_NO not like", value, "itemNo");
            return (Criteria) this;
        }

        public Criteria andItemNoIn(List<String> values) {
            addCriterion("ITEM_NO in", values, "itemNo");
            return (Criteria) this;
        }

        public Criteria andItemNoNotIn(List<String> values) {
            addCriterion("ITEM_NO not in", values, "itemNo");
            return (Criteria) this;
        }

        public Criteria andItemNoBetween(String value1, String value2) {
            addCriterion("ITEM_NO between", value1, value2, "itemNo");
            return (Criteria) this;
        }

        public Criteria andItemNoNotBetween(String value1, String value2) {
            addCriterion("ITEM_NO not between", value1, value2, "itemNo");
            return (Criteria) this;
        }

        public Criteria andBrandIdIsNull() {
            addCriterion("BRAND_ID is null");
            return (Criteria) this;
        }

        public Criteria andBrandIdIsNotNull() {
            addCriterion("BRAND_ID is not null");
            return (Criteria) this;
        }

        public Criteria andBrandIdEqualTo(Long value) {
            addCriterion("BRAND_ID =", value, "brandId");
            return (Criteria) this;
        }

        public Criteria andBrandIdNotEqualTo(Long value) {
            addCriterion("BRAND_ID <>", value, "brandId");
            return (Criteria) this;
        }

        public Criteria andBrandIdGreaterThan(Long value) {
            addCriterion("BRAND_ID >", value, "brandId");
            return (Criteria) this;
        }

        public Criteria andBrandIdGreaterThanOrEqualTo(Long value) {
            addCriterion("BRAND_ID >=", value, "brandId");
            return (Criteria) this;
        }

        public Criteria andBrandIdLessThan(Long value) {
            addCriterion("BRAND_ID <", value, "brandId");
            return (Criteria) this;
        }

        public Criteria andBrandIdLessThanOrEqualTo(Long value) {
            addCriterion("BRAND_ID <=", value, "brandId");
            return (Criteria) this;
        }

        public Criteria andBrandIdIn(List<Long> values) {
            addCriterion("BRAND_ID in", values, "brandId");
            return (Criteria) this;
        }

        public Criteria andBrandIdNotIn(List<Long> values) {
            addCriterion("BRAND_ID not in", values, "brandId");
            return (Criteria) this;
        }

        public Criteria andBrandIdBetween(Long value1, Long value2) {
            addCriterion("BRAND_ID between", value1, value2, "brandId");
            return (Criteria) this;
        }

        public Criteria andBrandIdNotBetween(Long value1, Long value2) {
            addCriterion("BRAND_ID not between", value1, value2, "brandId");
            return (Criteria) this;
        }

        public Criteria andCatIdIsNull() {
            addCriterion("CAT_ID is null");
            return (Criteria) this;
        }

        public Criteria andCatIdIsNotNull() {
            addCriterion("CAT_ID is not null");
            return (Criteria) this;
        }

        public Criteria andCatIdEqualTo(Long value) {
            addCriterion("CAT_ID =", value, "catId");
            return (Criteria) this;
        }

        public Criteria andCatIdNotEqualTo(Long value) {
            addCriterion("CAT_ID <>", value, "catId");
            return (Criteria) this;
        }

        public Criteria andCatIdGreaterThan(Long value) {
            addCriterion("CAT_ID >", value, "catId");
            return (Criteria) this;
        }

        public Criteria andCatIdGreaterThanOrEqualTo(Long value) {
            addCriterion("CAT_ID >=", value, "catId");
            return (Criteria) this;
        }

        public Criteria andCatIdLessThan(Long value) {
            addCriterion("CAT_ID <", value, "catId");
            return (Criteria) this;
        }

        public Criteria andCatIdLessThanOrEqualTo(Long value) {
            addCriterion("CAT_ID <=", value, "catId");
            return (Criteria) this;
        }

        public Criteria andCatIdIn(List<Long> values) {
            addCriterion("CAT_ID in", values, "catId");
            return (Criteria) this;
        }

        public Criteria andCatIdNotIn(List<Long> values) {
            addCriterion("CAT_ID not in", values, "catId");
            return (Criteria) this;
        }

        public Criteria andCatIdBetween(Long value1, Long value2) {
            addCriterion("CAT_ID between", value1, value2, "catId");
            return (Criteria) this;
        }

        public Criteria andCatIdNotBetween(Long value1, Long value2) {
            addCriterion("CAT_ID not between", value1, value2, "catId");
            return (Criteria) this;
        }

        public Criteria andTagImgIdIsNull() {
            addCriterion("TAG_IMG_ID is null");
            return (Criteria) this;
        }

        public Criteria andTagImgIdIsNotNull() {
            addCriterion("TAG_IMG_ID is not null");
            return (Criteria) this;
        }

        public Criteria andTagImgIdEqualTo(Long value) {
            addCriterion("TAG_IMG_ID =", value, "tagImgId");
            return (Criteria) this;
        }

        public Criteria andTagImgIdNotEqualTo(Long value) {
            addCriterion("TAG_IMG_ID <>", value, "tagImgId");
            return (Criteria) this;
        }

        public Criteria andTagImgIdGreaterThan(Long value) {
            addCriterion("TAG_IMG_ID >", value, "tagImgId");
            return (Criteria) this;
        }

        public Criteria andTagImgIdGreaterThanOrEqualTo(Long value) {
            addCriterion("TAG_IMG_ID >=", value, "tagImgId");
            return (Criteria) this;
        }

        public Criteria andTagImgIdLessThan(Long value) {
            addCriterion("TAG_IMG_ID <", value, "tagImgId");
            return (Criteria) this;
        }

        public Criteria andTagImgIdLessThanOrEqualTo(Long value) {
            addCriterion("TAG_IMG_ID <=", value, "tagImgId");
            return (Criteria) this;
        }

        public Criteria andTagImgIdIn(List<Long> values) {
            addCriterion("TAG_IMG_ID in", values, "tagImgId");
            return (Criteria) this;
        }

        public Criteria andTagImgIdNotIn(List<Long> values) {
            addCriterion("TAG_IMG_ID not in", values, "tagImgId");
            return (Criteria) this;
        }

        public Criteria andTagImgIdBetween(Long value1, Long value2) {
            addCriterion("TAG_IMG_ID between", value1, value2, "tagImgId");
            return (Criteria) this;
        }

        public Criteria andTagImgIdNotBetween(Long value1, Long value2) {
            addCriterion("TAG_IMG_ID not between", value1, value2, "tagImgId");
            return (Criteria) this;
        }

        public Criteria andTagImgIsNull() {
            addCriterion("TAG_IMG is null");
            return (Criteria) this;
        }

        public Criteria andTagImgIsNotNull() {
            addCriterion("TAG_IMG is not null");
            return (Criteria) this;
        }

        public Criteria andTagImgEqualTo(Short value) {
            addCriterion("TAG_IMG =", value, "tagImg");
            return (Criteria) this;
        }

        public Criteria andTagImgNotEqualTo(Short value) {
            addCriterion("TAG_IMG <>", value, "tagImg");
            return (Criteria) this;
        }

        public Criteria andTagImgGreaterThan(Short value) {
            addCriterion("TAG_IMG >", value, "tagImg");
            return (Criteria) this;
        }

        public Criteria andTagImgGreaterThanOrEqualTo(Short value) {
            addCriterion("TAG_IMG >=", value, "tagImg");
            return (Criteria) this;
        }

        public Criteria andTagImgLessThan(Short value) {
            addCriterion("TAG_IMG <", value, "tagImg");
            return (Criteria) this;
        }

        public Criteria andTagImgLessThanOrEqualTo(Short value) {
            addCriterion("TAG_IMG <=", value, "tagImg");
            return (Criteria) this;
        }

        public Criteria andTagImgIn(List<Short> values) {
            addCriterion("TAG_IMG in", values, "tagImg");
            return (Criteria) this;
        }

        public Criteria andTagImgNotIn(List<Short> values) {
            addCriterion("TAG_IMG not in", values, "tagImg");
            return (Criteria) this;
        }

        public Criteria andTagImgBetween(Short value1, Short value2) {
            addCriterion("TAG_IMG between", value1, value2, "tagImg");
            return (Criteria) this;
        }

        public Criteria andTagImgNotBetween(Short value1, Short value2) {
            addCriterion("TAG_IMG not between", value1, value2, "tagImg");
            return (Criteria) this;
        }

        public Criteria andIsNewIsNull() {
            addCriterion("IS_NEW is null");
            return (Criteria) this;
        }

        public Criteria andIsNewIsNotNull() {
            addCriterion("IS_NEW is not null");
            return (Criteria) this;
        }

        public Criteria andIsNewEqualTo(Short value) {
            addCriterion("IS_NEW =", value, "isNew");
            return (Criteria) this;
        }

        public Criteria andIsNewNotEqualTo(Short value) {
            addCriterion("IS_NEW <>", value, "isNew");
            return (Criteria) this;
        }

        public Criteria andIsNewGreaterThan(Short value) {
            addCriterion("IS_NEW >", value, "isNew");
            return (Criteria) this;
        }

        public Criteria andIsNewGreaterThanOrEqualTo(Short value) {
            addCriterion("IS_NEW >=", value, "isNew");
            return (Criteria) this;
        }

        public Criteria andIsNewLessThan(Short value) {
            addCriterion("IS_NEW <", value, "isNew");
            return (Criteria) this;
        }

        public Criteria andIsNewLessThanOrEqualTo(Short value) {
            addCriterion("IS_NEW <=", value, "isNew");
            return (Criteria) this;
        }

        public Criteria andIsNewIn(List<Short> values) {
            addCriterion("IS_NEW in", values, "isNew");
            return (Criteria) this;
        }

        public Criteria andIsNewNotIn(List<Short> values) {
            addCriterion("IS_NEW not in", values, "isNew");
            return (Criteria) this;
        }

        public Criteria andIsNewBetween(Short value1, Short value2) {
            addCriterion("IS_NEW between", value1, value2, "isNew");
            return (Criteria) this;
        }

        public Criteria andIsNewNotBetween(Short value1, Short value2) {
            addCriterion("IS_NEW not between", value1, value2, "isNew");
            return (Criteria) this;
        }

        public Criteria andIsGoodIsNull() {
            addCriterion("IS_GOOD is null");
            return (Criteria) this;
        }

        public Criteria andIsGoodIsNotNull() {
            addCriterion("IS_GOOD is not null");
            return (Criteria) this;
        }

        public Criteria andIsGoodEqualTo(Short value) {
            addCriterion("IS_GOOD =", value, "isGood");
            return (Criteria) this;
        }

        public Criteria andIsGoodNotEqualTo(Short value) {
            addCriterion("IS_GOOD <>", value, "isGood");
            return (Criteria) this;
        }

        public Criteria andIsGoodGreaterThan(Short value) {
            addCriterion("IS_GOOD >", value, "isGood");
            return (Criteria) this;
        }

        public Criteria andIsGoodGreaterThanOrEqualTo(Short value) {
            addCriterion("IS_GOOD >=", value, "isGood");
            return (Criteria) this;
        }

        public Criteria andIsGoodLessThan(Short value) {
            addCriterion("IS_GOOD <", value, "isGood");
            return (Criteria) this;
        }

        public Criteria andIsGoodLessThanOrEqualTo(Short value) {
            addCriterion("IS_GOOD <=", value, "isGood");
            return (Criteria) this;
        }

        public Criteria andIsGoodIn(List<Short> values) {
            addCriterion("IS_GOOD in", values, "isGood");
            return (Criteria) this;
        }

        public Criteria andIsGoodNotIn(List<Short> values) {
            addCriterion("IS_GOOD not in", values, "isGood");
            return (Criteria) this;
        }

        public Criteria andIsGoodBetween(Short value1, Short value2) {
            addCriterion("IS_GOOD between", value1, value2, "isGood");
            return (Criteria) this;
        }

        public Criteria andIsGoodNotBetween(Short value1, Short value2) {
            addCriterion("IS_GOOD not between", value1, value2, "isGood");
            return (Criteria) this;
        }

        public Criteria andIsHotIsNull() {
            addCriterion("IS_HOT is null");
            return (Criteria) this;
        }

        public Criteria andIsHotIsNotNull() {
            addCriterion("IS_HOT is not null");
            return (Criteria) this;
        }

        public Criteria andIsHotEqualTo(Short value) {
            addCriterion("IS_HOT =", value, "isHot");
            return (Criteria) this;
        }

        public Criteria andIsHotNotEqualTo(Short value) {
            addCriterion("IS_HOT <>", value, "isHot");
            return (Criteria) this;
        }

        public Criteria andIsHotGreaterThan(Short value) {
            addCriterion("IS_HOT >", value, "isHot");
            return (Criteria) this;
        }

        public Criteria andIsHotGreaterThanOrEqualTo(Short value) {
            addCriterion("IS_HOT >=", value, "isHot");
            return (Criteria) this;
        }

        public Criteria andIsHotLessThan(Short value) {
            addCriterion("IS_HOT <", value, "isHot");
            return (Criteria) this;
        }

        public Criteria andIsHotLessThanOrEqualTo(Short value) {
            addCriterion("IS_HOT <=", value, "isHot");
            return (Criteria) this;
        }

        public Criteria andIsHotIn(List<Short> values) {
            addCriterion("IS_HOT in", values, "isHot");
            return (Criteria) this;
        }

        public Criteria andIsHotNotIn(List<Short> values) {
            addCriterion("IS_HOT not in", values, "isHot");
            return (Criteria) this;
        }

        public Criteria andIsHotBetween(Short value1, Short value2) {
            addCriterion("IS_HOT between", value1, value2, "isHot");
            return (Criteria) this;
        }

        public Criteria andIsHotNotBetween(Short value1, Short value2) {
            addCriterion("IS_HOT not between", value1, value2, "isHot");
            return (Criteria) this;
        }

        public Criteria andPromotionIsNull() {
            addCriterion("PROMOTION is null");
            return (Criteria) this;
        }

        public Criteria andPromotionIsNotNull() {
            addCriterion("PROMOTION is not null");
            return (Criteria) this;
        }

        public Criteria andPromotionEqualTo(String value) {
            addCriterion("PROMOTION =", value, "promotion");
            return (Criteria) this;
        }

        public Criteria andPromotionNotEqualTo(String value) {
            addCriterion("PROMOTION <>", value, "promotion");
            return (Criteria) this;
        }

        public Criteria andPromotionGreaterThan(String value) {
            addCriterion("PROMOTION >", value, "promotion");
            return (Criteria) this;
        }

        public Criteria andPromotionGreaterThanOrEqualTo(String value) {
            addCriterion("PROMOTION >=", value, "promotion");
            return (Criteria) this;
        }

        public Criteria andPromotionLessThan(String value) {
            addCriterion("PROMOTION <", value, "promotion");
            return (Criteria) this;
        }

        public Criteria andPromotionLessThanOrEqualTo(String value) {
            addCriterion("PROMOTION <=", value, "promotion");
            return (Criteria) this;
        }

        public Criteria andPromotionLike(String value) {
            addCriterion("PROMOTION like", value, "promotion");
            return (Criteria) this;
        }

        public Criteria andPromotionNotLike(String value) {
            addCriterion("PROMOTION not like", value, "promotion");
            return (Criteria) this;
        }

        public Criteria andPromotionIn(List<String> values) {
            addCriterion("PROMOTION in", values, "promotion");
            return (Criteria) this;
        }

        public Criteria andPromotionNotIn(List<String> values) {
            addCriterion("PROMOTION not in", values, "promotion");
            return (Criteria) this;
        }

        public Criteria andPromotionBetween(String value1, String value2) {
            addCriterion("PROMOTION between", value1, value2, "promotion");
            return (Criteria) this;
        }

        public Criteria andPromotionNotBetween(String value1, String value2) {
            addCriterion("PROMOTION not between", value1, value2, "promotion");
            return (Criteria) this;
        }

        public Criteria andAuditStatusIsNull() {
            addCriterion("AUDIT_STATUS is null");
            return (Criteria) this;
        }

        public Criteria andAuditStatusIsNotNull() {
            addCriterion("AUDIT_STATUS is not null");
            return (Criteria) this;
        }

        public Criteria andAuditStatusEqualTo(Short value) {
            addCriterion("AUDIT_STATUS =", value, "auditStatus");
            return (Criteria) this;
        }

        public Criteria andAuditStatusNotEqualTo(Short value) {
            addCriterion("AUDIT_STATUS <>", value, "auditStatus");
            return (Criteria) this;
        }

        public Criteria andAuditStatusGreaterThan(Short value) {
            addCriterion("AUDIT_STATUS >", value, "auditStatus");
            return (Criteria) this;
        }

        public Criteria andAuditStatusGreaterThanOrEqualTo(Short value) {
            addCriterion("AUDIT_STATUS >=", value, "auditStatus");
            return (Criteria) this;
        }

        public Criteria andAuditStatusLessThan(Short value) {
            addCriterion("AUDIT_STATUS <", value, "auditStatus");
            return (Criteria) this;
        }

        public Criteria andAuditStatusLessThanOrEqualTo(Short value) {
            addCriterion("AUDIT_STATUS <=", value, "auditStatus");
            return (Criteria) this;
        }

        public Criteria andAuditStatusIn(List<Short> values) {
            addCriterion("AUDIT_STATUS in", values, "auditStatus");
            return (Criteria) this;
        }

        public Criteria andAuditStatusNotIn(List<Short> values) {
            addCriterion("AUDIT_STATUS not in", values, "auditStatus");
            return (Criteria) this;
        }

        public Criteria andAuditStatusBetween(Short value1, Short value2) {
            addCriterion("AUDIT_STATUS between", value1, value2, "auditStatus");
            return (Criteria) this;
        }

        public Criteria andAuditStatusNotBetween(Short value1, Short value2) {
            addCriterion("AUDIT_STATUS not between", value1, value2, "auditStatus");
            return (Criteria) this;
        }

        public Criteria andShowStatusIsNull() {
            addCriterion("SHOW_STATUS is null");
            return (Criteria) this;
        }

        public Criteria andShowStatusIsNotNull() {
            addCriterion("SHOW_STATUS is not null");
            return (Criteria) this;
        }

        public Criteria andShowStatusEqualTo(Short value) {
            addCriterion("SHOW_STATUS =", value, "showStatus");
            return (Criteria) this;
        }

        public Criteria andShowStatusNotEqualTo(Short value) {
            addCriterion("SHOW_STATUS <>", value, "showStatus");
            return (Criteria) this;
        }

        public Criteria andShowStatusGreaterThan(Short value) {
            addCriterion("SHOW_STATUS >", value, "showStatus");
            return (Criteria) this;
        }

        public Criteria andShowStatusGreaterThanOrEqualTo(Short value) {
            addCriterion("SHOW_STATUS >=", value, "showStatus");
            return (Criteria) this;
        }

        public Criteria andShowStatusLessThan(Short value) {
            addCriterion("SHOW_STATUS <", value, "showStatus");
            return (Criteria) this;
        }

        public Criteria andShowStatusLessThanOrEqualTo(Short value) {
            addCriterion("SHOW_STATUS <=", value, "showStatus");
            return (Criteria) this;
        }

        public Criteria andShowStatusIn(List<Short> values) {
            addCriterion("SHOW_STATUS in", values, "showStatus");
            return (Criteria) this;
        }

        public Criteria andShowStatusNotIn(List<Short> values) {
            addCriterion("SHOW_STATUS not in", values, "showStatus");
            return (Criteria) this;
        }

        public Criteria andShowStatusBetween(Short value1, Short value2) {
            addCriterion("SHOW_STATUS between", value1, value2, "showStatus");
            return (Criteria) this;
        }

        public Criteria andShowStatusNotBetween(Short value1, Short value2) {
            addCriterion("SHOW_STATUS not between", value1, value2, "showStatus");
            return (Criteria) this;
        }

        public Criteria andImgsIsNull() {
            addCriterion("IMGS is null");
            return (Criteria) this;
        }

        public Criteria andImgsIsNotNull() {
            addCriterion("IMGS is not null");
            return (Criteria) this;
        }

        public Criteria andImgsEqualTo(String value) {
            addCriterion("IMGS =", value, "imgs");
            return (Criteria) this;
        }

        public Criteria andImgsNotEqualTo(String value) {
            addCriterion("IMGS <>", value, "imgs");
            return (Criteria) this;
        }

        public Criteria andImgsGreaterThan(String value) {
            addCriterion("IMGS >", value, "imgs");
            return (Criteria) this;
        }

        public Criteria andImgsGreaterThanOrEqualTo(String value) {
            addCriterion("IMGS >=", value, "imgs");
            return (Criteria) this;
        }

        public Criteria andImgsLessThan(String value) {
            addCriterion("IMGS <", value, "imgs");
            return (Criteria) this;
        }

        public Criteria andImgsLessThanOrEqualTo(String value) {
            addCriterion("IMGS <=", value, "imgs");
            return (Criteria) this;
        }

        public Criteria andImgsLike(String value) {
            addCriterion("IMGS like", value, "imgs");
            return (Criteria) this;
        }

        public Criteria andImgsNotLike(String value) {
            addCriterion("IMGS not like", value, "imgs");
            return (Criteria) this;
        }

        public Criteria andImgsIn(List<String> values) {
            addCriterion("IMGS in", values, "imgs");
            return (Criteria) this;
        }

        public Criteria andImgsNotIn(List<String> values) {
            addCriterion("IMGS not in", values, "imgs");
            return (Criteria) this;
        }

        public Criteria andImgsBetween(String value1, String value2) {
            addCriterion("IMGS between", value1, value2, "imgs");
            return (Criteria) this;
        }

        public Criteria andImgsNotBetween(String value1, String value2) {
            addCriterion("IMGS not between", value1, value2, "imgs");
            return (Criteria) this;
        }

        public Criteria andKeywordsIsNull() {
            addCriterion("KEYWORDS is null");
            return (Criteria) this;
        }

        public Criteria andKeywordsIsNotNull() {
            addCriterion("KEYWORDS is not null");
            return (Criteria) this;
        }

        public Criteria andKeywordsEqualTo(String value) {
            addCriterion("KEYWORDS =", value, "keywords");
            return (Criteria) this;
        }

        public Criteria andKeywordsNotEqualTo(String value) {
            addCriterion("KEYWORDS <>", value, "keywords");
            return (Criteria) this;
        }

        public Criteria andKeywordsGreaterThan(String value) {
            addCriterion("KEYWORDS >", value, "keywords");
            return (Criteria) this;
        }

        public Criteria andKeywordsGreaterThanOrEqualTo(String value) {
            addCriterion("KEYWORDS >=", value, "keywords");
            return (Criteria) this;
        }

        public Criteria andKeywordsLessThan(String value) {
            addCriterion("KEYWORDS <", value, "keywords");
            return (Criteria) this;
        }

        public Criteria andKeywordsLessThanOrEqualTo(String value) {
            addCriterion("KEYWORDS <=", value, "keywords");
            return (Criteria) this;
        }

        public Criteria andKeywordsLike(String value) {
            addCriterion("KEYWORDS like", value, "keywords");
            return (Criteria) this;
        }

        public Criteria andKeywordsNotLike(String value) {
            addCriterion("KEYWORDS not like", value, "keywords");
            return (Criteria) this;
        }

        public Criteria andKeywordsIn(List<String> values) {
            addCriterion("KEYWORDS in", values, "keywords");
            return (Criteria) this;
        }

        public Criteria andKeywordsNotIn(List<String> values) {
            addCriterion("KEYWORDS not in", values, "keywords");
            return (Criteria) this;
        }

        public Criteria andKeywordsBetween(String value1, String value2) {
            addCriterion("KEYWORDS between", value1, value2, "keywords");
            return (Criteria) this;
        }

        public Criteria andKeywordsNotBetween(String value1, String value2) {
            addCriterion("KEYWORDS not between", value1, value2, "keywords");
            return (Criteria) this;
        }

        public Criteria andPageDescIsNull() {
            addCriterion("PAGE_DESC is null");
            return (Criteria) this;
        }

        public Criteria andPageDescIsNotNull() {
            addCriterion("PAGE_DESC is not null");
            return (Criteria) this;
        }

        public Criteria andPageDescEqualTo(String value) {
            addCriterion("PAGE_DESC =", value, "pageDesc");
            return (Criteria) this;
        }

        public Criteria andPageDescNotEqualTo(String value) {
            addCriterion("PAGE_DESC <>", value, "pageDesc");
            return (Criteria) this;
        }

        public Criteria andPageDescGreaterThan(String value) {
            addCriterion("PAGE_DESC >", value, "pageDesc");
            return (Criteria) this;
        }

        public Criteria andPageDescGreaterThanOrEqualTo(String value) {
            addCriterion("PAGE_DESC >=", value, "pageDesc");
            return (Criteria) this;
        }

        public Criteria andPageDescLessThan(String value) {
            addCriterion("PAGE_DESC <", value, "pageDesc");
            return (Criteria) this;
        }

        public Criteria andPageDescLessThanOrEqualTo(String value) {
            addCriterion("PAGE_DESC <=", value, "pageDesc");
            return (Criteria) this;
        }

        public Criteria andPageDescLike(String value) {
            addCriterion("PAGE_DESC like", value, "pageDesc");
            return (Criteria) this;
        }

        public Criteria andPageDescNotLike(String value) {
            addCriterion("PAGE_DESC not like", value, "pageDesc");
            return (Criteria) this;
        }

        public Criteria andPageDescIn(List<String> values) {
            addCriterion("PAGE_DESC in", values, "pageDesc");
            return (Criteria) this;
        }

        public Criteria andPageDescNotIn(List<String> values) {
            addCriterion("PAGE_DESC not in", values, "pageDesc");
            return (Criteria) this;
        }

        public Criteria andPageDescBetween(String value1, String value2) {
            addCriterion("PAGE_DESC between", value1, value2, "pageDesc");
            return (Criteria) this;
        }

        public Criteria andPageDescNotBetween(String value1, String value2) {
            addCriterion("PAGE_DESC not between", value1, value2, "pageDesc");
            return (Criteria) this;
        }

        public Criteria andItemRecycleIsNull() {
            addCriterion("ITEM_RECYCLE is null");
            return (Criteria) this;
        }

        public Criteria andItemRecycleIsNotNull() {
            addCriterion("ITEM_RECYCLE is not null");
            return (Criteria) this;
        }

        public Criteria andItemRecycleEqualTo(Short value) {
            addCriterion("ITEM_RECYCLE =", value, "itemRecycle");
            return (Criteria) this;
        }

        public Criteria andItemRecycleNotEqualTo(Short value) {
            addCriterion("ITEM_RECYCLE <>", value, "itemRecycle");
            return (Criteria) this;
        }

        public Criteria andItemRecycleGreaterThan(Short value) {
            addCriterion("ITEM_RECYCLE >", value, "itemRecycle");
            return (Criteria) this;
        }

        public Criteria andItemRecycleGreaterThanOrEqualTo(Short value) {
            addCriterion("ITEM_RECYCLE >=", value, "itemRecycle");
            return (Criteria) this;
        }

        public Criteria andItemRecycleLessThan(Short value) {
            addCriterion("ITEM_RECYCLE <", value, "itemRecycle");
            return (Criteria) this;
        }

        public Criteria andItemRecycleLessThanOrEqualTo(Short value) {
            addCriterion("ITEM_RECYCLE <=", value, "itemRecycle");
            return (Criteria) this;
        }

        public Criteria andItemRecycleIn(List<Short> values) {
            addCriterion("ITEM_RECYCLE in", values, "itemRecycle");
            return (Criteria) this;
        }

        public Criteria andItemRecycleNotIn(List<Short> values) {
            addCriterion("ITEM_RECYCLE not in", values, "itemRecycle");
            return (Criteria) this;
        }

        public Criteria andItemRecycleBetween(Short value1, Short value2) {
            addCriterion("ITEM_RECYCLE between", value1, value2, "itemRecycle");
            return (Criteria) this;
        }

        public Criteria andItemRecycleNotBetween(Short value1, Short value2) {
            addCriterion("ITEM_RECYCLE not between", value1, value2, "itemRecycle");
            return (Criteria) this;
        }

        public Criteria andOnSaleTimeIsNull() {
            addCriterion("ON_SALE_TIME is null");
            return (Criteria) this;
        }

        public Criteria andOnSaleTimeIsNotNull() {
            addCriterion("ON_SALE_TIME is not null");
            return (Criteria) this;
        }

        public Criteria andOnSaleTimeEqualTo(Date value) {
            addCriterion("ON_SALE_TIME =", value, "onSaleTime");
            return (Criteria) this;
        }

        public Criteria andOnSaleTimeNotEqualTo(Date value) {
            addCriterion("ON_SALE_TIME <>", value, "onSaleTime");
            return (Criteria) this;
        }

        public Criteria andOnSaleTimeGreaterThan(Date value) {
            addCriterion("ON_SALE_TIME >", value, "onSaleTime");
            return (Criteria) this;
        }

        public Criteria andOnSaleTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("ON_SALE_TIME >=", value, "onSaleTime");
            return (Criteria) this;
        }

        public Criteria andOnSaleTimeLessThan(Date value) {
            addCriterion("ON_SALE_TIME <", value, "onSaleTime");
            return (Criteria) this;
        }

        public Criteria andOnSaleTimeLessThanOrEqualTo(Date value) {
            addCriterion("ON_SALE_TIME <=", value, "onSaleTime");
            return (Criteria) this;
        }

        public Criteria andOnSaleTimeIn(List<Date> values) {
            addCriterion("ON_SALE_TIME in", values, "onSaleTime");
            return (Criteria) this;
        }

        public Criteria andOnSaleTimeNotIn(List<Date> values) {
            addCriterion("ON_SALE_TIME not in", values, "onSaleTime");
            return (Criteria) this;
        }

        public Criteria andOnSaleTimeBetween(Date value1, Date value2) {
            addCriterion("ON_SALE_TIME between", value1, value2, "onSaleTime");
            return (Criteria) this;
        }

        public Criteria andOnSaleTimeNotBetween(Date value1, Date value2) {
            addCriterion("ON_SALE_TIME not between", value1, value2, "onSaleTime");
            return (Criteria) this;
        }

        public Criteria andCheckTimeIsNull() {
            addCriterion("CHECK_TIME is null");
            return (Criteria) this;
        }

        public Criteria andCheckTimeIsNotNull() {
            addCriterion("CHECK_TIME is not null");
            return (Criteria) this;
        }

        public Criteria andCheckTimeEqualTo(Date value) {
            addCriterion("CHECK_TIME =", value, "checkTime");
            return (Criteria) this;
        }

        public Criteria andCheckTimeNotEqualTo(Date value) {
            addCriterion("CHECK_TIME <>", value, "checkTime");
            return (Criteria) this;
        }

        public Criteria andCheckTimeGreaterThan(Date value) {
            addCriterion("CHECK_TIME >", value, "checkTime");
            return (Criteria) this;
        }

        public Criteria andCheckTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("CHECK_TIME >=", value, "checkTime");
            return (Criteria) this;
        }

        public Criteria andCheckTimeLessThan(Date value) {
            addCriterion("CHECK_TIME <", value, "checkTime");
            return (Criteria) this;
        }

        public Criteria andCheckTimeLessThanOrEqualTo(Date value) {
            addCriterion("CHECK_TIME <=", value, "checkTime");
            return (Criteria) this;
        }

        public Criteria andCheckTimeIn(List<Date> values) {
            addCriterion("CHECK_TIME in", values, "checkTime");
            return (Criteria) this;
        }

        public Criteria andCheckTimeNotIn(List<Date> values) {
            addCriterion("CHECK_TIME not in", values, "checkTime");
            return (Criteria) this;
        }

        public Criteria andCheckTimeBetween(Date value1, Date value2) {
            addCriterion("CHECK_TIME between", value1, value2, "checkTime");
            return (Criteria) this;
        }

        public Criteria andCheckTimeNotBetween(Date value1, Date value2) {
            addCriterion("CHECK_TIME not between", value1, value2, "checkTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeIsNull() {
            addCriterion("UPDATE_TIME is null");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeIsNotNull() {
            addCriterion("UPDATE_TIME is not null");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeEqualTo(Date value) {
            addCriterion("UPDATE_TIME =", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeNotEqualTo(Date value) {
            addCriterion("UPDATE_TIME <>", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeGreaterThan(Date value) {
            addCriterion("UPDATE_TIME >", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("UPDATE_TIME >=", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeLessThan(Date value) {
            addCriterion("UPDATE_TIME <", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeLessThanOrEqualTo(Date value) {
            addCriterion("UPDATE_TIME <=", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeIn(List<Date> values) {
            addCriterion("UPDATE_TIME in", values, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeNotIn(List<Date> values) {
            addCriterion("UPDATE_TIME not in", values, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeBetween(Date value1, Date value2) {
            addCriterion("UPDATE_TIME between", value1, value2, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeNotBetween(Date value1, Date value2) {
            addCriterion("UPDATE_TIME not between", value1, value2, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateUserIdIsNull() {
            addCriterion("UPDATE_USER_ID is null");
            return (Criteria) this;
        }

        public Criteria andUpdateUserIdIsNotNull() {
            addCriterion("UPDATE_USER_ID is not null");
            return (Criteria) this;
        }

        public Criteria andUpdateUserIdEqualTo(Long value) {
            addCriterion("UPDATE_USER_ID =", value, "updateUserId");
            return (Criteria) this;
        }

        public Criteria andUpdateUserIdNotEqualTo(Long value) {
            addCriterion("UPDATE_USER_ID <>", value, "updateUserId");
            return (Criteria) this;
        }

        public Criteria andUpdateUserIdGreaterThan(Long value) {
            addCriterion("UPDATE_USER_ID >", value, "updateUserId");
            return (Criteria) this;
        }

        public Criteria andUpdateUserIdGreaterThanOrEqualTo(Long value) {
            addCriterion("UPDATE_USER_ID >=", value, "updateUserId");
            return (Criteria) this;
        }

        public Criteria andUpdateUserIdLessThan(Long value) {
            addCriterion("UPDATE_USER_ID <", value, "updateUserId");
            return (Criteria) this;
        }

        public Criteria andUpdateUserIdLessThanOrEqualTo(Long value) {
            addCriterion("UPDATE_USER_ID <=", value, "updateUserId");
            return (Criteria) this;
        }

        public Criteria andUpdateUserIdIn(List<Long> values) {
            addCriterion("UPDATE_USER_ID in", values, "updateUserId");
            return (Criteria) this;
        }

        public Criteria andUpdateUserIdNotIn(List<Long> values) {
            addCriterion("UPDATE_USER_ID not in", values, "updateUserId");
            return (Criteria) this;
        }

        public Criteria andUpdateUserIdBetween(Long value1, Long value2) {
            addCriterion("UPDATE_USER_ID between", value1, value2, "updateUserId");
            return (Criteria) this;
        }

        public Criteria andUpdateUserIdNotBetween(Long value1, Long value2) {
            addCriterion("UPDATE_USER_ID not between", value1, value2, "updateUserId");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNull() {
            addCriterion("CREATE_TIME is null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNotNull() {
            addCriterion("CREATE_TIME is not null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeEqualTo(Date value) {
            addCriterion("CREATE_TIME =", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotEqualTo(Date value) {
            addCriterion("CREATE_TIME <>", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThan(Date value) {
            addCriterion("CREATE_TIME >", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("CREATE_TIME >=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThan(Date value) {
            addCriterion("CREATE_TIME <", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThanOrEqualTo(Date value) {
            addCriterion("CREATE_TIME <=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIn(List<Date> values) {
            addCriterion("CREATE_TIME in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotIn(List<Date> values) {
            addCriterion("CREATE_TIME not in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeBetween(Date value1, Date value2) {
            addCriterion("CREATE_TIME between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotBetween(Date value1, Date value2) {
            addCriterion("CREATE_TIME not between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andCheckerUserIdIsNull() {
            addCriterion("CHECKER_USER_ID is null");
            return (Criteria) this;
        }

        public Criteria andCheckerUserIdIsNotNull() {
            addCriterion("CHECKER_USER_ID is not null");
            return (Criteria) this;
        }

        public Criteria andCheckerUserIdEqualTo(Long value) {
            addCriterion("CHECKER_USER_ID =", value, "checkerUserId");
            return (Criteria) this;
        }

        public Criteria andCheckerUserIdNotEqualTo(Long value) {
            addCriterion("CHECKER_USER_ID <>", value, "checkerUserId");
            return (Criteria) this;
        }

        public Criteria andCheckerUserIdGreaterThan(Long value) {
            addCriterion("CHECKER_USER_ID >", value, "checkerUserId");
            return (Criteria) this;
        }

        public Criteria andCheckerUserIdGreaterThanOrEqualTo(Long value) {
            addCriterion("CHECKER_USER_ID >=", value, "checkerUserId");
            return (Criteria) this;
        }

        public Criteria andCheckerUserIdLessThan(Long value) {
            addCriterion("CHECKER_USER_ID <", value, "checkerUserId");
            return (Criteria) this;
        }

        public Criteria andCheckerUserIdLessThanOrEqualTo(Long value) {
            addCriterion("CHECKER_USER_ID <=", value, "checkerUserId");
            return (Criteria) this;
        }

        public Criteria andCheckerUserIdIn(List<Long> values) {
            addCriterion("CHECKER_USER_ID in", values, "checkerUserId");
            return (Criteria) this;
        }

        public Criteria andCheckerUserIdNotIn(List<Long> values) {
            addCriterion("CHECKER_USER_ID not in", values, "checkerUserId");
            return (Criteria) this;
        }

        public Criteria andCheckerUserIdBetween(Long value1, Long value2) {
            addCriterion("CHECKER_USER_ID between", value1, value2, "checkerUserId");
            return (Criteria) this;
        }

        public Criteria andCheckerUserIdNotBetween(Long value1, Long value2) {
            addCriterion("CHECKER_USER_ID not between", value1, value2, "checkerUserId");
            return (Criteria) this;
        }

        public Criteria andFullPathDeployIsNull() {
            addCriterion("FULL_PATH_DEPLOY is null");
            return (Criteria) this;
        }

        public Criteria andFullPathDeployIsNotNull() {
            addCriterion("FULL_PATH_DEPLOY is not null");
            return (Criteria) this;
        }

        public Criteria andFullPathDeployEqualTo(String value) {
            addCriterion("FULL_PATH_DEPLOY =", value, "fullPathDeploy");
            return (Criteria) this;
        }

        public Criteria andFullPathDeployNotEqualTo(String value) {
            addCriterion("FULL_PATH_DEPLOY <>", value, "fullPathDeploy");
            return (Criteria) this;
        }

        public Criteria andFullPathDeployGreaterThan(String value) {
            addCriterion("FULL_PATH_DEPLOY >", value, "fullPathDeploy");
            return (Criteria) this;
        }

        public Criteria andFullPathDeployGreaterThanOrEqualTo(String value) {
            addCriterion("FULL_PATH_DEPLOY >=", value, "fullPathDeploy");
            return (Criteria) this;
        }

        public Criteria andFullPathDeployLessThan(String value) {
            addCriterion("FULL_PATH_DEPLOY <", value, "fullPathDeploy");
            return (Criteria) this;
        }

        public Criteria andFullPathDeployLessThanOrEqualTo(String value) {
            addCriterion("FULL_PATH_DEPLOY <=", value, "fullPathDeploy");
            return (Criteria) this;
        }

        public Criteria andFullPathDeployLike(String value) {
            addCriterion("FULL_PATH_DEPLOY like", value, "fullPathDeploy");
            return (Criteria) this;
        }

        public Criteria andFullPathDeployNotLike(String value) {
            addCriterion("FULL_PATH_DEPLOY not like", value, "fullPathDeploy");
            return (Criteria) this;
        }

        public Criteria andFullPathDeployIn(List<String> values) {
            addCriterion("FULL_PATH_DEPLOY in", values, "fullPathDeploy");
            return (Criteria) this;
        }

        public Criteria andFullPathDeployNotIn(List<String> values) {
            addCriterion("FULL_PATH_DEPLOY not in", values, "fullPathDeploy");
            return (Criteria) this;
        }

        public Criteria andFullPathDeployBetween(String value1, String value2) {
            addCriterion("FULL_PATH_DEPLOY between", value1, value2, "fullPathDeploy");
            return (Criteria) this;
        }

        public Criteria andFullPathDeployNotBetween(String value1, String value2) {
            addCriterion("FULL_PATH_DEPLOY not between", value1, value2, "fullPathDeploy");
            return (Criteria) this;
        }

        public Criteria andFullPathDeployOfferIsNull() {
            addCriterion("FULL_PATH_DEPLOY_OFFER is null");
            return (Criteria) this;
        }

        public Criteria andFullPathDeployOfferIsNotNull() {
            addCriterion("FULL_PATH_DEPLOY_OFFER is not null");
            return (Criteria) this;
        }

        public Criteria andFullPathDeployOfferEqualTo(String value) {
            addCriterion("FULL_PATH_DEPLOY_OFFER =", value, "fullPathDeployOffer");
            return (Criteria) this;
        }

        public Criteria andFullPathDeployOfferNotEqualTo(String value) {
            addCriterion("FULL_PATH_DEPLOY_OFFER <>", value, "fullPathDeployOffer");
            return (Criteria) this;
        }

        public Criteria andFullPathDeployOfferGreaterThan(String value) {
            addCriterion("FULL_PATH_DEPLOY_OFFER >", value, "fullPathDeployOffer");
            return (Criteria) this;
        }

        public Criteria andFullPathDeployOfferGreaterThanOrEqualTo(String value) {
            addCriterion("FULL_PATH_DEPLOY_OFFER >=", value, "fullPathDeployOffer");
            return (Criteria) this;
        }

        public Criteria andFullPathDeployOfferLessThan(String value) {
            addCriterion("FULL_PATH_DEPLOY_OFFER <", value, "fullPathDeployOffer");
            return (Criteria) this;
        }

        public Criteria andFullPathDeployOfferLessThanOrEqualTo(String value) {
            addCriterion("FULL_PATH_DEPLOY_OFFER <=", value, "fullPathDeployOffer");
            return (Criteria) this;
        }

        public Criteria andFullPathDeployOfferLike(String value) {
            addCriterion("FULL_PATH_DEPLOY_OFFER like", value, "fullPathDeployOffer");
            return (Criteria) this;
        }

        public Criteria andFullPathDeployOfferNotLike(String value) {
            addCriterion("FULL_PATH_DEPLOY_OFFER not like", value, "fullPathDeployOffer");
            return (Criteria) this;
        }

        public Criteria andFullPathDeployOfferIn(List<String> values) {
            addCriterion("FULL_PATH_DEPLOY_OFFER in", values, "fullPathDeployOffer");
            return (Criteria) this;
        }

        public Criteria andFullPathDeployOfferNotIn(List<String> values) {
            addCriterion("FULL_PATH_DEPLOY_OFFER not in", values, "fullPathDeployOffer");
            return (Criteria) this;
        }

        public Criteria andFullPathDeployOfferBetween(String value1, String value2) {
            addCriterion("FULL_PATH_DEPLOY_OFFER between", value1, value2, "fullPathDeployOffer");
            return (Criteria) this;
        }

        public Criteria andFullPathDeployOfferNotBetween(String value1, String value2) {
            addCriterion("FULL_PATH_DEPLOY_OFFER not between", value1, value2, "fullPathDeployOffer");
            return (Criteria) this;
        }

        public Criteria andOriginalItemIdIsNull() {
            addCriterion("ORIGINAL_ITEM_ID is null");
            return (Criteria) this;
        }

        public Criteria andOriginalItemIdIsNotNull() {
            addCriterion("ORIGINAL_ITEM_ID is not null");
            return (Criteria) this;
        }

        public Criteria andOriginalItemIdEqualTo(Long value) {
            addCriterion("ORIGINAL_ITEM_ID =", value, "originalItemId");
            return (Criteria) this;
        }

        public Criteria andOriginalItemIdNotEqualTo(Long value) {
            addCriterion("ORIGINAL_ITEM_ID <>", value, "originalItemId");
            return (Criteria) this;
        }

        public Criteria andOriginalItemIdGreaterThan(Long value) {
            addCriterion("ORIGINAL_ITEM_ID >", value, "originalItemId");
            return (Criteria) this;
        }

        public Criteria andOriginalItemIdGreaterThanOrEqualTo(Long value) {
            addCriterion("ORIGINAL_ITEM_ID >=", value, "originalItemId");
            return (Criteria) this;
        }

        public Criteria andOriginalItemIdLessThan(Long value) {
            addCriterion("ORIGINAL_ITEM_ID <", value, "originalItemId");
            return (Criteria) this;
        }

        public Criteria andOriginalItemIdLessThanOrEqualTo(Long value) {
            addCriterion("ORIGINAL_ITEM_ID <=", value, "originalItemId");
            return (Criteria) this;
        }

        public Criteria andOriginalItemIdIn(List<Long> values) {
            addCriterion("ORIGINAL_ITEM_ID in", values, "originalItemId");
            return (Criteria) this;
        }

        public Criteria andOriginalItemIdNotIn(List<Long> values) {
            addCriterion("ORIGINAL_ITEM_ID not in", values, "originalItemId");
            return (Criteria) this;
        }

        public Criteria andOriginalItemIdBetween(Long value1, Long value2) {
            addCriterion("ORIGINAL_ITEM_ID between", value1, value2, "originalItemId");
            return (Criteria) this;
        }

        public Criteria andOriginalItemIdNotBetween(Long value1, Long value2) {
            addCriterion("ORIGINAL_ITEM_ID not between", value1, value2, "originalItemId");
            return (Criteria) this;
        }

        public Criteria andLastStatusIsNull() {
            addCriterion("LAST_STATUS is null");
            return (Criteria) this;
        }

        public Criteria andLastStatusIsNotNull() {
            addCriterion("LAST_STATUS is not null");
            return (Criteria) this;
        }

        public Criteria andLastStatusEqualTo(Short value) {
            addCriterion("LAST_STATUS =", value, "lastStatus");
            return (Criteria) this;
        }

        public Criteria andLastStatusNotEqualTo(Short value) {
            addCriterion("LAST_STATUS <>", value, "lastStatus");
            return (Criteria) this;
        }

        public Criteria andLastStatusGreaterThan(Short value) {
            addCriterion("LAST_STATUS >", value, "lastStatus");
            return (Criteria) this;
        }

        public Criteria andLastStatusGreaterThanOrEqualTo(Short value) {
            addCriterion("LAST_STATUS >=", value, "lastStatus");
            return (Criteria) this;
        }

        public Criteria andLastStatusLessThan(Short value) {
            addCriterion("LAST_STATUS <", value, "lastStatus");
            return (Criteria) this;
        }

        public Criteria andLastStatusLessThanOrEqualTo(Short value) {
            addCriterion("LAST_STATUS <=", value, "lastStatus");
            return (Criteria) this;
        }

        public Criteria andLastStatusIn(List<Short> values) {
            addCriterion("LAST_STATUS in", values, "lastStatus");
            return (Criteria) this;
        }

        public Criteria andLastStatusNotIn(List<Short> values) {
            addCriterion("LAST_STATUS not in", values, "lastStatus");
            return (Criteria) this;
        }

        public Criteria andLastStatusBetween(Short value1, Short value2) {
            addCriterion("LAST_STATUS between", value1, value2, "lastStatus");
            return (Criteria) this;
        }

        public Criteria andLastStatusNotBetween(Short value1, Short value2) {
            addCriterion("LAST_STATUS not between", value1, value2, "lastStatus");
            return (Criteria) this;
        }

        public Criteria andMerchantIdIsNull() {
            addCriterion("MERCHANT_ID is null");
            return (Criteria) this;
        }

        public Criteria andMerchantIdIsNotNull() {
            addCriterion("MERCHANT_ID is not null");
            return (Criteria) this;
        }

        public Criteria andMerchantIdEqualTo(Long value) {
            addCriterion("MERCHANT_ID =", value, "merchantId");
            return (Criteria) this;
        }

        public Criteria andMerchantIdNotEqualTo(Long value) {
            addCriterion("MERCHANT_ID <>", value, "merchantId");
            return (Criteria) this;
        }

        public Criteria andMerchantIdGreaterThan(Long value) {
            addCriterion("MERCHANT_ID >", value, "merchantId");
            return (Criteria) this;
        }

        public Criteria andMerchantIdGreaterThanOrEqualTo(Long value) {
            addCriterion("MERCHANT_ID >=", value, "merchantId");
            return (Criteria) this;
        }

        public Criteria andMerchantIdLessThan(Long value) {
            addCriterion("MERCHANT_ID <", value, "merchantId");
            return (Criteria) this;
        }

        public Criteria andMerchantIdLessThanOrEqualTo(Long value) {
            addCriterion("MERCHANT_ID <=", value, "merchantId");
            return (Criteria) this;
        }

        public Criteria andMerchantIdIn(List<Long> values) {
            addCriterion("MERCHANT_ID in", values, "merchantId");
            return (Criteria) this;
        }

        public Criteria andMerchantIdNotIn(List<Long> values) {
            addCriterion("MERCHANT_ID not in", values, "merchantId");
            return (Criteria) this;
        }

        public Criteria andMerchantIdBetween(Long value1, Long value2) {
            addCriterion("MERCHANT_ID between", value1, value2, "merchantId");
            return (Criteria) this;
        }

        public Criteria andMerchantIdNotBetween(Long value1, Long value2) {
            addCriterion("MERCHANT_ID not between", value1, value2, "merchantId");
            return (Criteria) this;
        }

        public Criteria andItemSortIsNull() {
            addCriterion("ITEM_SORT is null");
            return (Criteria) this;
        }

        public Criteria andItemSortIsNotNull() {
            addCriterion("ITEM_SORT is not null");
            return (Criteria) this;
        }

        public Criteria andItemSortEqualTo(Long value) {
            addCriterion("ITEM_SORT =", value, "itemSort");
            return (Criteria) this;
        }

        public Criteria andItemSortNotEqualTo(Long value) {
            addCriterion("ITEM_SORT <>", value, "itemSort");
            return (Criteria) this;
        }

        public Criteria andItemSortGreaterThan(Long value) {
            addCriterion("ITEM_SORT >", value, "itemSort");
            return (Criteria) this;
        }

        public Criteria andItemSortGreaterThanOrEqualTo(Long value) {
            addCriterion("ITEM_SORT >=", value, "itemSort");
            return (Criteria) this;
        }

        public Criteria andItemSortLessThan(Long value) {
            addCriterion("ITEM_SORT <", value, "itemSort");
            return (Criteria) this;
        }

        public Criteria andItemSortLessThanOrEqualTo(Long value) {
            addCriterion("ITEM_SORT <=", value, "itemSort");
            return (Criteria) this;
        }

        public Criteria andItemSortIn(List<Long> values) {
            addCriterion("ITEM_SORT in", values, "itemSort");
            return (Criteria) this;
        }

        public Criteria andItemSortNotIn(List<Long> values) {
            addCriterion("ITEM_SORT not in", values, "itemSort");
            return (Criteria) this;
        }

        public Criteria andItemSortBetween(Long value1, Long value2) {
            addCriterion("ITEM_SORT between", value1, value2, "itemSort");
            return (Criteria) this;
        }

        public Criteria andItemSortNotBetween(Long value1, Long value2) {
            addCriterion("ITEM_SORT not between", value1, value2, "itemSort");
            return (Criteria) this;
        }

        public Criteria andSalesIsNull() {
            addCriterion("SALES is null");
            return (Criteria) this;
        }

        public Criteria andSalesIsNotNull() {
            addCriterion("SALES is not null");
            return (Criteria) this;
        }

        public Criteria andSalesEqualTo(Long value) {
            addCriterion("SALES =", value, "sales");
            return (Criteria) this;
        }

        public Criteria andSalesNotEqualTo(Long value) {
            addCriterion("SALES <>", value, "sales");
            return (Criteria) this;
        }

        public Criteria andSalesGreaterThan(Long value) {
            addCriterion("SALES >", value, "sales");
            return (Criteria) this;
        }

        public Criteria andSalesGreaterThanOrEqualTo(Long value) {
            addCriterion("SALES >=", value, "sales");
            return (Criteria) this;
        }

        public Criteria andSalesLessThan(Long value) {
            addCriterion("SALES <", value, "sales");
            return (Criteria) this;
        }

        public Criteria andSalesLessThanOrEqualTo(Long value) {
            addCriterion("SALES <=", value, "sales");
            return (Criteria) this;
        }

        public Criteria andSalesIn(List<Long> values) {
            addCriterion("SALES in", values, "sales");
            return (Criteria) this;
        }

        public Criteria andSalesNotIn(List<Long> values) {
            addCriterion("SALES not in", values, "sales");
            return (Criteria) this;
        }

        public Criteria andSalesBetween(Long value1, Long value2) {
            addCriterion("SALES between", value1, value2, "sales");
            return (Criteria) this;
        }

        public Criteria andSalesNotBetween(Long value1, Long value2) {
            addCriterion("SALES not between", value1, value2, "sales");
            return (Criteria) this;
        }

        public Criteria andCreateUserIdIsNull() {
            addCriterion("CREATE_USER_ID is null");
            return (Criteria) this;
        }

        public Criteria andCreateUserIdIsNotNull() {
            addCriterion("CREATE_USER_ID is not null");
            return (Criteria) this;
        }

        public Criteria andCreateUserIdEqualTo(Long value) {
            addCriterion("CREATE_USER_ID =", value, "createUserId");
            return (Criteria) this;
        }

        public Criteria andCreateUserIdNotEqualTo(Long value) {
            addCriterion("CREATE_USER_ID <>", value, "createUserId");
            return (Criteria) this;
        }

        public Criteria andCreateUserIdGreaterThan(Long value) {
            addCriterion("CREATE_USER_ID >", value, "createUserId");
            return (Criteria) this;
        }

        public Criteria andCreateUserIdGreaterThanOrEqualTo(Long value) {
            addCriterion("CREATE_USER_ID >=", value, "createUserId");
            return (Criteria) this;
        }

        public Criteria andCreateUserIdLessThan(Long value) {
            addCriterion("CREATE_USER_ID <", value, "createUserId");
            return (Criteria) this;
        }

        public Criteria andCreateUserIdLessThanOrEqualTo(Long value) {
            addCriterion("CREATE_USER_ID <=", value, "createUserId");
            return (Criteria) this;
        }

        public Criteria andCreateUserIdIn(List<Long> values) {
            addCriterion("CREATE_USER_ID in", values, "createUserId");
            return (Criteria) this;
        }

        public Criteria andCreateUserIdNotIn(List<Long> values) {
            addCriterion("CREATE_USER_ID not in", values, "createUserId");
            return (Criteria) this;
        }

        public Criteria andCreateUserIdBetween(Long value1, Long value2) {
            addCriterion("CREATE_USER_ID between", value1, value2, "createUserId");
            return (Criteria) this;
        }

        public Criteria andCreateUserIdNotBetween(Long value1, Long value2) {
            addCriterion("CREATE_USER_ID not between", value1, value2, "createUserId");
            return (Criteria) this;
        }

        public Criteria andSimLevelIsNull() {
            addCriterion("SIM_LEVEL is null");
            return (Criteria) this;
        }

        public Criteria andSimLevelIsNotNull() {
            addCriterion("SIM_LEVEL is not null");
            return (Criteria) this;
        }

        public Criteria andSimLevelEqualTo(Short value) {
            addCriterion("SIM_LEVEL =", value, "simLevel");
            return (Criteria) this;
        }

        public Criteria andSimLevelNotEqualTo(Short value) {
            addCriterion("SIM_LEVEL <>", value, "simLevel");
            return (Criteria) this;
        }

        public Criteria andSimLevelGreaterThan(Short value) {
            addCriterion("SIM_LEVEL >", value, "simLevel");
            return (Criteria) this;
        }

        public Criteria andSimLevelGreaterThanOrEqualTo(Short value) {
            addCriterion("SIM_LEVEL >=", value, "simLevel");
            return (Criteria) this;
        }

        public Criteria andSimLevelLessThan(Short value) {
            addCriterion("SIM_LEVEL <", value, "simLevel");
            return (Criteria) this;
        }

        public Criteria andSimLevelLessThanOrEqualTo(Short value) {
            addCriterion("SIM_LEVEL <=", value, "simLevel");
            return (Criteria) this;
        }

        public Criteria andSimLevelIn(List<Short> values) {
            addCriterion("SIM_LEVEL in", values, "simLevel");
            return (Criteria) this;
        }

        public Criteria andSimLevelNotIn(List<Short> values) {
            addCriterion("SIM_LEVEL not in", values, "simLevel");
            return (Criteria) this;
        }

        public Criteria andSimLevelBetween(Short value1, Short value2) {
            addCriterion("SIM_LEVEL between", value1, value2, "simLevel");
            return (Criteria) this;
        }

        public Criteria andSimLevelNotBetween(Short value1, Short value2) {
            addCriterion("SIM_LEVEL not between", value1, value2, "simLevel");
            return (Criteria) this;
        }

        public Criteria andGiftDescIsNull() {
            addCriterion("GIFT_DESC is null");
            return (Criteria) this;
        }

        public Criteria andGiftDescIsNotNull() {
            addCriterion("GIFT_DESC is not null");
            return (Criteria) this;
        }

        public Criteria andGiftDescEqualTo(String value) {
            addCriterion("GIFT_DESC =", value, "giftDesc");
            return (Criteria) this;
        }

        public Criteria andGiftDescNotEqualTo(String value) {
            addCriterion("GIFT_DESC <>", value, "giftDesc");
            return (Criteria) this;
        }

        public Criteria andGiftDescGreaterThan(String value) {
            addCriterion("GIFT_DESC >", value, "giftDesc");
            return (Criteria) this;
        }

        public Criteria andGiftDescGreaterThanOrEqualTo(String value) {
            addCriterion("GIFT_DESC >=", value, "giftDesc");
            return (Criteria) this;
        }

        public Criteria andGiftDescLessThan(String value) {
            addCriterion("GIFT_DESC <", value, "giftDesc");
            return (Criteria) this;
        }

        public Criteria andGiftDescLessThanOrEqualTo(String value) {
            addCriterion("GIFT_DESC <=", value, "giftDesc");
            return (Criteria) this;
        }

        public Criteria andGiftDescLike(String value) {
            addCriterion("GIFT_DESC like", value, "giftDesc");
            return (Criteria) this;
        }

        public Criteria andGiftDescNotLike(String value) {
            addCriterion("GIFT_DESC not like", value, "giftDesc");
            return (Criteria) this;
        }

        public Criteria andGiftDescIn(List<String> values) {
            addCriterion("GIFT_DESC in", values, "giftDesc");
            return (Criteria) this;
        }

        public Criteria andGiftDescNotIn(List<String> values) {
            addCriterion("GIFT_DESC not in", values, "giftDesc");
            return (Criteria) this;
        }

        public Criteria andGiftDescBetween(String value1, String value2) {
            addCriterion("GIFT_DESC between", value1, value2, "giftDesc");
            return (Criteria) this;
        }

        public Criteria andGiftDescNotBetween(String value1, String value2) {
            addCriterion("GIFT_DESC not between", value1, value2, "giftDesc");
            return (Criteria) this;
        }

        public Criteria andGiftImgIsNull() {
            addCriterion("GIFT_IMG is null");
            return (Criteria) this;
        }

        public Criteria andGiftImgIsNotNull() {
            addCriterion("GIFT_IMG is not null");
            return (Criteria) this;
        }

        public Criteria andGiftImgEqualTo(String value) {
            addCriterion("GIFT_IMG =", value, "giftImg");
            return (Criteria) this;
        }

        public Criteria andGiftImgNotEqualTo(String value) {
            addCriterion("GIFT_IMG <>", value, "giftImg");
            return (Criteria) this;
        }

        public Criteria andGiftImgGreaterThan(String value) {
            addCriterion("GIFT_IMG >", value, "giftImg");
            return (Criteria) this;
        }

        public Criteria andGiftImgGreaterThanOrEqualTo(String value) {
            addCriterion("GIFT_IMG >=", value, "giftImg");
            return (Criteria) this;
        }

        public Criteria andGiftImgLessThan(String value) {
            addCriterion("GIFT_IMG <", value, "giftImg");
            return (Criteria) this;
        }

        public Criteria andGiftImgLessThanOrEqualTo(String value) {
            addCriterion("GIFT_IMG <=", value, "giftImg");
            return (Criteria) this;
        }

        public Criteria andGiftImgLike(String value) {
            addCriterion("GIFT_IMG like", value, "giftImg");
            return (Criteria) this;
        }

        public Criteria andGiftImgNotLike(String value) {
            addCriterion("GIFT_IMG not like", value, "giftImg");
            return (Criteria) this;
        }

        public Criteria andGiftImgIn(List<String> values) {
            addCriterion("GIFT_IMG in", values, "giftImg");
            return (Criteria) this;
        }

        public Criteria andGiftImgNotIn(List<String> values) {
            addCriterion("GIFT_IMG not in", values, "giftImg");
            return (Criteria) this;
        }

        public Criteria andGiftImgBetween(String value1, String value2) {
            addCriterion("GIFT_IMG between", value1, value2, "giftImg");
            return (Criteria) this;
        }

        public Criteria andGiftImgNotBetween(String value1, String value2) {
            addCriterion("GIFT_IMG not between", value1, value2, "giftImg");
            return (Criteria) this;
        }

        public Criteria andGiftShowTypeIsNull() {
            addCriterion("GIFT_SHOW_TYPE is null");
            return (Criteria) this;
        }

        public Criteria andGiftShowTypeIsNotNull() {
            addCriterion("GIFT_SHOW_TYPE is not null");
            return (Criteria) this;
        }

        public Criteria andGiftShowTypeEqualTo(String value) {
            addCriterion("GIFT_SHOW_TYPE =", value, "giftShowType");
            return (Criteria) this;
        }

        public Criteria andGiftShowTypeNotEqualTo(String value) {
            addCriterion("GIFT_SHOW_TYPE <>", value, "giftShowType");
            return (Criteria) this;
        }

        public Criteria andGiftShowTypeGreaterThan(String value) {
            addCriterion("GIFT_SHOW_TYPE >", value, "giftShowType");
            return (Criteria) this;
        }

        public Criteria andGiftShowTypeGreaterThanOrEqualTo(String value) {
            addCriterion("GIFT_SHOW_TYPE >=", value, "giftShowType");
            return (Criteria) this;
        }

        public Criteria andGiftShowTypeLessThan(String value) {
            addCriterion("GIFT_SHOW_TYPE <", value, "giftShowType");
            return (Criteria) this;
        }

        public Criteria andGiftShowTypeLessThanOrEqualTo(String value) {
            addCriterion("GIFT_SHOW_TYPE <=", value, "giftShowType");
            return (Criteria) this;
        }

        public Criteria andGiftShowTypeLike(String value) {
            addCriterion("GIFT_SHOW_TYPE like", value, "giftShowType");
            return (Criteria) this;
        }

        public Criteria andGiftShowTypeNotLike(String value) {
            addCriterion("GIFT_SHOW_TYPE not like", value, "giftShowType");
            return (Criteria) this;
        }

        public Criteria andGiftShowTypeIn(List<String> values) {
            addCriterion("GIFT_SHOW_TYPE in", values, "giftShowType");
            return (Criteria) this;
        }

        public Criteria andGiftShowTypeNotIn(List<String> values) {
            addCriterion("GIFT_SHOW_TYPE not in", values, "giftShowType");
            return (Criteria) this;
        }

        public Criteria andGiftShowTypeBetween(String value1, String value2) {
            addCriterion("GIFT_SHOW_TYPE between", value1, value2, "giftShowType");
            return (Criteria) this;
        }

        public Criteria andGiftShowTypeNotBetween(String value1, String value2) {
            addCriterion("GIFT_SHOW_TYPE not between", value1, value2, "giftShowType");
            return (Criteria) this;
        }

        public Criteria andImgSize1IsNull() {
            addCriterion("IMG_SIZE1 is null");
            return (Criteria) this;
        }

        public Criteria andImgSize1IsNotNull() {
            addCriterion("IMG_SIZE1 is not null");
            return (Criteria) this;
        }

        public Criteria andImgSize1EqualTo(String value) {
            addCriterion("IMG_SIZE1 =", value, "imgSize1");
            return (Criteria) this;
        }

        public Criteria andImgSize1NotEqualTo(String value) {
            addCriterion("IMG_SIZE1 <>", value, "imgSize1");
            return (Criteria) this;
        }

        public Criteria andImgSize1GreaterThan(String value) {
            addCriterion("IMG_SIZE1 >", value, "imgSize1");
            return (Criteria) this;
        }

        public Criteria andImgSize1GreaterThanOrEqualTo(String value) {
            addCriterion("IMG_SIZE1 >=", value, "imgSize1");
            return (Criteria) this;
        }

        public Criteria andImgSize1LessThan(String value) {
            addCriterion("IMG_SIZE1 <", value, "imgSize1");
            return (Criteria) this;
        }

        public Criteria andImgSize1LessThanOrEqualTo(String value) {
            addCriterion("IMG_SIZE1 <=", value, "imgSize1");
            return (Criteria) this;
        }

        public Criteria andImgSize1Like(String value) {
            addCriterion("IMG_SIZE1 like", value, "imgSize1");
            return (Criteria) this;
        }

        public Criteria andImgSize1NotLike(String value) {
            addCriterion("IMG_SIZE1 not like", value, "imgSize1");
            return (Criteria) this;
        }

        public Criteria andImgSize1In(List<String> values) {
            addCriterion("IMG_SIZE1 in", values, "imgSize1");
            return (Criteria) this;
        }

        public Criteria andImgSize1NotIn(List<String> values) {
            addCriterion("IMG_SIZE1 not in", values, "imgSize1");
            return (Criteria) this;
        }

        public Criteria andImgSize1Between(String value1, String value2) {
            addCriterion("IMG_SIZE1 between", value1, value2, "imgSize1");
            return (Criteria) this;
        }

        public Criteria andImgSize1NotBetween(String value1, String value2) {
            addCriterion("IMG_SIZE1 not between", value1, value2, "imgSize1");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}