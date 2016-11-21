package com.quadi.dao;

import static org.hibernate.criterion.Example.create;

import java.util.List;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.transaction.annotation.Transactional;

import com.quadi.entity.Mentions;

/**
 * A data access object (DAO) providing persistence and search support for
 * Mentions entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.quadi.dao.Mentions
 * @author MyEclipse Persistence Tools
 */
@Transactional
public class MentionsDAO {
	private static final Logger log = LoggerFactory
			.getLogger(MentionsDAO.class);
	// property constants

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	protected void initDao() {
		// do nothing
	}

	public void save(Mentions transientInstance) {
		log.debug("saving Mentions instance");
		try {
			getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Mentions persistentInstance) {
		log.debug("deleting Mentions instance");
		try {
			getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Mentions findById(java.lang.Integer id) {
		log.debug("getting Mentions instance with id: " + id);
		try {
			Mentions instance = (Mentions) getCurrentSession().get(
					"com.quadi.dao.Mentions", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<Mentions> findByExample(Mentions instance) {
		log.debug("finding Mentions instance by example");
		try {
			List<Mentions> results = (List<Mentions>) getCurrentSession()
					.createCriteria("com.quadi.dao.Mentions")
					.add(create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Mentions instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Mentions as model where model."
					+ propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all Mentions instances");
		try {
			String queryString = "from Mentions";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Mentions merge(Mentions detachedInstance) {
		log.debug("merging Mentions instance");
		try {
			Mentions result = (Mentions) getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Mentions instance) {
		log.debug("attaching dirty Mentions instance");
		try {
			getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Mentions instance) {
		log.debug("attaching clean Mentions instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static MentionsDAO getFromApplicationContext(ApplicationContext ctx) {
		return (MentionsDAO) ctx.getBean("MentionsDAO");
	}
}