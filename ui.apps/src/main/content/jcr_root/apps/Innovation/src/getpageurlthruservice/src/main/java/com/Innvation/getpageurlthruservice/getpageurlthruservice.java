package com.Innvation.getpageurlthruservice;

import org.osgi.framework.BundleActivator;
import org.osgi.framework.BundleContext;

@Component(immediate = true)
@Service(getpageurlthruservice.class)
public class getpageurlthruservice {

	@Reference
	private ResourceResolverFactory resourceResolverFactory;
 
	private static final String resourcePath = "/content/phonegap/geometrixx/apps/ng-geometrixx-outdoors/en/home/reviews";
 
	/**
	 * This method is executed at component startup rather than in the context of a request.
	 */
	@Activate
	public void getSpecificPage() {
		ResourceResolver resourceResolver = null;
		try {
			resourceResolver = resourceResolverFactory.getAdministrativeResourceResolver(null);
			Page page = getSpecificPage(resourceResolver);
			System.out.println(page.getTitle());
		} catch (LoginException e) {
			e.printStackTrace();
		} finally {
			if (resourceResolver != null) {
				resourceResolver.close();
			}
		}
	}
 
	/**
	 * This method does not use the ResourceResolverFactory, but uses a user supplied resolver
	 */
	public Page getSpecificPage(ResourceResolver resourceResolver) {
		Resource resource = resourceResolver.resolve(pageUri);
		return resource.adaptTo(Page.class);
 
	}
}